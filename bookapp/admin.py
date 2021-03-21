from flask import redirect,render_template,request
from flask import session
from flask_admin import BaseView, expose
from flask_admin.contrib.sqla import ModelView
from flask_login import logout_user, current_user
from bookapp.models import DonHang
from bookapp.models import UserRole,Sach,TheLoai,User,KhachHang,NhanVien,PhieuNhap,ChiTietPhieuNhap,GhiNo,DiaChi
from bookapp import admin, db,utils,app
import  os ,json
from datetime import date
class LogoutView(BaseView):
    @expose('/')
    def index(self):
        logout_user()
        return redirect('/')

    def is_accessible(self):
        if not current_user.is_active or not current_user.is_authenticated:
            return False

        if current_user.is_authenticated:
            return True

        return False



class XemQuyDinh(BaseView):
    @expose('/')
    def index(self):
        qd = utils.read_data()

        return self.render('admin/xemquydinh.html',qd=qd)

    def is_accessible(self):
        if not current_user.is_active or not current_user.is_authenticated:
            return False

        if current_user.user_role == UserRole.ADMIN or current_user.user_role == UserRole.NHANVIEN:
            return True

        return False
#thay doi duy dinh

class ThayDoiQuyDinh(BaseView):
    @expose('/' ,methods=('GET', 'POST'))
    def thaydoiquydinh(self):
        qd = utils.read_data()
        err_msg = ""
        if request.method == 'POST':

            soluongnhap = request.form.get('soluongnhap')
            soluongtonnhap= request.form.get('soluongtonnhap')
            soluongtonban = request.form.get('soluongtonban')
            sotienno= request.form.get('sotienno')
            if soluongnhap:
                qd['soluongnhap'] = soluongnhap
            if soluongtonnhap:
                qd['soluongtonnhap'] = soluongtonnhap
            if soluongtonban:
                qd['soluongtonban'] = soluongtonban
            if sotienno:
                qd['sotienno'] = sotienno
            a_file = open("data/quydinh.json", "w")
            json.dump(qd, a_file)
            a_file.close()

            err_msg = "Thay đổi quy định thành công"
        return self.render('admin/thaydoiquydinh.html',qd=qd,err_msg=err_msg)

    def is_accessible(self):
        if not current_user.is_active or not current_user.is_authenticated:
            return False

        if current_user.user_role == UserRole.ADMIN:
            return True

        return False

class MyViewAdmin(BaseView):
    @expose('/')
    def index(self):
        return self.render()

    def is_accessible(self):
        if not current_user.is_active or not current_user.is_authenticated:
            return False

        if current_user.user_role == UserRole.ADMIN or current_user.user_role == UserRole.NHANVIEN:
            return True

        return False

UPLOAD_FOLDER = './static/images/upload'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
class themsach(BaseView):
    @expose('/', methods=('GET', 'POST'))
    def index(self):
        theloai = utils.read_theloai()
        err_msg = ""
        if request.method == 'POST':

            name = request.form.get('name')
            tacgia = request.form.get('tacgia')
            mota = request.form.get('mota')
            nhaxb = request.form.get('nhaxb')
            namxb = request.form.get('namxb')
            soluong = request.form.get('soluong')
            tentheloaii = request.form.get('theloai')
            gia = request.form.get('gia')
            file = request.files['anh']
            if file.filename == "":
                avatar_path = 'images/sach/sach1.jpg'
            else:
                path = os.path.join(app.config['UPLOAD_FOLDER'], file.filename)
                file.save(path)
                avatar_path = 'images/upload/%s' % file.filename
            if utils.add_book(name=name,tacgia=tacgia,mota=mota,nhaxb=nhaxb,namxb=namxb,anh=avatar_path
                              ,soluong=soluong,theloainame=tentheloaii,gia=gia):
                err_msg = "Tạo sách thành công"
            else:
                err_msg = "Lỗi Hệ Thống"
        return self.render('admin/themsach.html',theloai=theloai,err_msg=err_msg)

    def is_accessible(self):
        if not current_user.is_active or not current_user.is_authenticated:
            return False

        if current_user.user_role == UserRole.ADMIN or current_user.user_role == UserRole.NHANVIEN:
            return True

        return False

class chitheiphieunhap(BaseView):
    @expose('/', methods=('GET', 'POST'))
    def indexpn(self):

        err_msg = ""
        sach = utils.read_products()
        phieunhap = utils.read_phieuNhap()
        if request.method == 'POST':

            sach_id = request.form.get('sachid')
            phieunhap_id = request.form.get('phieunhapid')
            dongia = request.form.get('dongia')
            soluong = request.form.get('soluong')
            sl = int(soluong)
            if utils.kiemtraSoLuongNhap(sl) and utils.kiemtraSoLuongTon(sach_id):
                if utils.add_chi_tiet_phieu_nhap(sach_id,phieunhap_id,dongia,soluong):
                    err_msg ="Thêm Sách vào phiếu nhập thành công"
            else:
                err_msg = "Vi phạm quy định nhập"
        return self.render('admin/chitietphieunhap.html',sach=sach,err_msg=err_msg,phieunhap=phieunhap)

    def is_accessible(self):
        if not current_user.is_active or not current_user.is_authenticated:
            return False

        if current_user.user_role == UserRole.ADMIN or current_user.user_role == UserRole.NHANVIEN:
            return True

        return False


class BanHang(BaseView):
    @expose('/', methods=('GET', 'POST'))
    def banhang(self):
        err_msg = ""
        sach = utils.read_products()
        quan, price = utils.cart_stats(session.get('cart'))
        cart_info = {
            'total_quantity': quan,
            'total_amount': price
        }
        today = date.today()
        idnv = utils.get_id_nv(current_user.id)

        iddonhangcuoi= db.session.query(DonHang).order_by(DonHang.id.desc()).first()
        if request.method == 'POST':
            if utils.kiemTragiohang(session.get('cart')):
                if utils.add_receipt(session.get('cart'), 1, 1, "Tại nhà sách", "317 phường 3, Nguyễn Kiệm,Gò Vấp,HCM", "0945320117", idnv,1):
                    del session['cart']
                    err_msg = "Thành Công"
                    return redirect('/admin/banhang/')
                else:
                    err_msg = "lỗi hệ thống"
            else:
                err_msg = "Tồn tại sản phẩm hết hàng vui lòng mua ít lại"
        return self.render('admin/banhang.html', sach=sach, err_msg=err_msg, cart_info=cart_info,today=today,iddonhangcuoi=iddonhangcuoi)



    def is_accessible(self):
        if not current_user.is_active or not current_user.is_authenticated:
            return False

        if current_user.user_role == UserRole.ADMIN or current_user.user_role == UserRole.NHANVIEN:
            return True

        return False
class XemThongTinDonHang(BaseView):
    @expose('/', methods=('GET', 'POST'))
    def thongtindonhang(self):
        err_msg = ""
        sach = utils.read_products()
        donhang = utils.read_xemthongtindonhang()
        return self.render('admin/xemdonhang.html', sach=sach, err_msg=err_msg,donhang=donhang)



    def is_accessible(self):
        if not current_user.is_active or not current_user.is_authenticated:
            return False

        if current_user.user_role == UserRole.ADMIN or current_user.user_role == UserRole.NHANVIEN:
            return True

        return False
class MyView(BaseView):
    def __init__(self, *args, **kwargs):
        self._default_view = True
        super(MyView, self).__init__(*args, **kwargs)
        self.admin = admin

#xemthongtinchitiet cua don hang
@app.route('/admin/xemdonhang/<int:dh_id>',methods=['get', 'post'])
def xemthongtinchitietad(dh_id):

    err_msg = ""
    sach = utils.read_products()
    tong = utils.read_tongdh(dh_id)
    ctdh = utils.read_chitietdonhan(dh_id)
    dcnh = utils.read_diachinhanhang(dh_id)

    return MyView().render('admin/xemchitietdonhang.html',sach=sach,tong=tong,ctdh=ctdh,dcnh=dcnh)



class NewModelView(ModelView):
    column_display_pk = True
    can_create = False

    def is_accessible(self):
        if not current_user.is_active or not current_user.is_authenticated:
            return False

        if current_user.user_role == UserRole.ADMIN or current_user.user_role == UserRole.NHANVIEN:
            return True

class NewModelViewCoTheTao(ModelView):
    column_display_pk = True
    can_create = True

    def is_accessible(self):
        if not current_user.is_active or not current_user.is_authenticated:
            return False

        if current_user.user_role == UserRole.ADMIN or current_user.user_role == UserRole.NHANVIEN:
            return True







#Trang ghi nợ
class GhiNoView(BaseView):
    @expose('/', methods=('GET', 'POST'))
    def ghino(self):
        err_msg = ""
        kh = db.session.query(KhachHang)
        ghino = db.session.query(GhiNo)
        donhang = db.session.query(DonHang).filter(DonHang.isthanhtoan==1).all()
        user = db.session.query(User)
        if request.method == 'POST':
            donhangid = request.form.get('donhang')
            khachhang= request.form.get('khachhang')
            nv = utils.get_id_nv(current_user.id)
            if utils.kiemTraSoTienNo(donhangid):
                if utils.kiemtrakhachhangno(khachhang):
                    if utils.add_ghiNo(nv,khachhang,donhangid):
                        err_msg = "Lưu thành công!!"
                else:
                    err_msg = "Khách hàng chưa trả nợ! vui lòng báo khách hàng trả nợ!"
            else:
                err_msg = "Vi phạm quy định cho ghi nợ"

        return self.render('admin/ghino.html', kh=kh, err_msg=err_msg,donhang=donhang,user=user,ghino=ghino)


    def is_accessible(self):
        if not current_user.is_active or not current_user.is_authenticated:
            return False

        if current_user.user_role == UserRole.ADMIN or current_user.user_role == UserRole.NHANVIEN:
            return True

        return False

#code xem khách hàng:

class xemkhachhang(BaseView):
    @expose('/', methods=('GET', 'POST'))
    def xemkhachanh(self):
        err_msg = ""
        user = db.session.query(User).filter(User.id == KhachHang.user_id)
        kh = db.session.query(KhachHang).all()
        return self.render('admin/xemkhachhang.html', err_msg=err_msg,user=user,kh=kh)

    def is_accessible(self):
        if not current_user.is_active or not current_user.is_authenticated:
            return False

        if current_user.user_role == UserRole.ADMIN or current_user.user_role == UserRole.NHANVIEN:
            return True

        return False

#xem thông tin nhân viên
class XemNhanVien(BaseView):
    @expose('/', methods=('GET', 'POST'))
    def xemnhanvien(self):
        err_msg = ""

        user = db.session.query(User).filter(User.id == NhanVien.user_id)
        nv = db.session.query(NhanVien).all()
        dc = db.session.query(DiaChi).all()
        return self.render('admin/xemthongtinhanvien.html', err_msg=err_msg,user=user,nv=nv,dc=dc)

    def is_accessible(self):
        if not current_user.is_active or not current_user.is_authenticated:
            return False

        if current_user.user_role == UserRole.ADMIN:
            return True

        return False


#trang tao nhan vien:
class ThemNhanVien(BaseView):
    @expose('/', methods=('GET', 'POST'))
    def themnhanvien(self):
        err_msg = ""

        if request.method == 'POST':
            name = request.form.get('name')
            email = request.form.get('email')
            password = request.form.get('password')
            confirm = request.form.get('confirm-password')
            if password == confirm:
                username = request.form.get('username')
                ngaysinh = request.form.get('ngaysinh')
                gioitinh = request.form.get('gioitinh')
                sdt = request.form.get('sdt')
                cmnd = request.form.get('cmnd')
                sonha = request.form.get('sonha')
                phuongxa = request.form.get('phuongxa')
                quanhuyen = request.form.get('quanhuyen')
                tinhtp = request.form.get('tinhtp')
                avatar_path = 'images/upload/abc.jpg'
                if utils.kiemTraUserName(username):
                    err_msg = "Tên đăng nhập đã được sử dụng"
                elif utils.register_user(name=name, username=username, password=password,
                                         email=email, avatar=avatar_path, gioitinh=gioitinh, ngaysinh=ngaysinh,
                                         sdt=sdt,sonha=sonha,phongxa=phuongxa,quanhuyen=quanhuyen,tinhtp=tinhtp,user_role=utils.UserRole.NHANVIEN):
                    u = utils.get_id_user(username)
                    utils.add_nv(u,cmnd)
                    err_msg = "Tạo tài khoản thành công"
            else:
                err_msg = "Xác nhập lại mật khẩu không đúng vui lòng thử lại"

        return self.render('admin/taonhanvien.html',err_msg=err_msg)


    def is_accessible(self):
        if not current_user.is_active or not current_user.is_authenticated:
            return False

        if current_user.user_role == UserRole.ADMIN:
            return True

        return False

#trang tao nhan vien:
class ThuTienNo(BaseView):
    @expose('/', methods=('GET', 'POST'))
    def thutieno(self):
        err_msg = ""
        kh = db.session.query(KhachHang).join(GhiNo).filter(KhachHang.id == GhiNo.kh_id).filter(GhiNo.istrano==False).all()
        user = db.session.query(User)
        phieuno= db.session.query(GhiNo)
        khachhangno = ''
        dc = ''
        phieuthu =""
        today = date.today()
        if request.method == 'POST':
            idkh = request.form.get('khachhang')
            khachhangno = db.session.query(User).join(KhachHang).filter(User.id==KhachHang.user_id).\
                filter(KhachHang.id ==idkh).first()
            dc = db.session.query(DiaChi).join(User).filter(DiaChi.id==User.diaChi_id).join(KhachHang).filter(User.id==KhachHang.user_id).\
                filter(KhachHang.id ==idkh).first()
            phieuthu = db.session.query(GhiNo).filter(idkh == GhiNo.kh_id).first()
            #thêm vao phiêu thu nợ
            if utils.add_vao_phieu_thuno(phieuthu.stt,phieuthu.tienno):
                err_msg ="Thêm thành công"
        return self.render('admin/phieuthutien.html',err_msg=err_msg,phieuno=phieuno,user=user,kh=kh,khachhangno=khachhangno,\
                           dc=dc,phieuthu = phieuthu,today=today)


    def is_accessible(self):
        if not current_user.is_active or not current_user.is_authenticated:
            return False

        if current_user.user_role == UserRole.ADMIN or current_user.user_role == UserRole.NHANVIEN:
            return True

        return False


class XemChiTietPhieuNhap(BaseView):
    @expose('/', methods=('GET', 'POST'))
    def thutieno(self):
        err_msg = ""
        phieunhap =db.session.query(PhieuNhap)
        idphieunhap = ""
        ctpn =""
        sach = db.session.query(Sach).all()
        if request.method == 'POST':
            idpn = request.form.get('phieunhap')
            idphieunhap = db.session.query(PhieuNhap).filter(PhieuNhap.id == idpn).first()
            ctpn = db.session.query(ChiTietPhieuNhap).join(PhieuNhap).filter(PhieuNhap.id==ChiTietPhieuNhap.phieunhap_id).filter(PhieuNhap.id==idpn).all()



        return self.render('admin/xemchitietphieunhap.html',err_msg=err_msg,phieunhap=phieunhap,idphieunhap=idphieunhap,ctpn=ctpn,sach=sach)


    def is_accessible(self):
        if not current_user.is_active or not current_user.is_authenticated:
            return False

        if current_user.user_role == UserRole.ADMIN or current_user.user_role == UserRole.NHANVIEN:
            return True

        return False


#trang tao nhan vien:
class BaoCao(BaseView):
    @expose('/', methods=('GET', 'POST'))
    def BaoCao(self):
        legend = 'Dữ liệu tồn cuối kho'
        legends = 'Dữ liệu tồn nợ cuối'
        labels = ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6", "Tháng 7", "Tháng 8", "Tháng 9",
                  "Tháng 10", \
                  "Tháng 11", "Tháng 12"]
        a = 5
        tondau =0;
        toncuoi =0;
        phatsinh = 0;
        getthang = 0
        tondauno =0;
        toncuoino =0;
        phatsinhno = 0;
        values = []
        valuesno = []
        if request.method == 'POST':
            getthang = request.form.get('thang')
            getnam = request.form.get('nam')
            phatsinh = utils.phatsinhtang(getthang, getnam) - utils.phatsinhgiam(getthang, getnam)
            phatsinhno = utils.phatsinhtangno(getthang, getnam) - utils.phatsinhgiamno(getthang, getnam)
            toncuoi = utils.luongtoncuoi(0, utils.phatsinhtang(getthang, getnam), utils.phatsinhgiam(getthang, getnam))
            nam = getnam
            thang1 = 0;
            thang2 = 0;
            thang3 = 0;
            thang4 = 0;
            thang5 = 0;
            thang6 = 0;
            thang7 = 0;
            thang8 = 0;
            thang9 = 0;
            thang10 = 0;
            thang11 = 0;
            thang12 = 0;
            x = 0;
            while x <= 12:
                if x == 1:
                    thang1 = utils.luongtoncuoi(0, utils.phatsinhtang(1, nam), utils.phatsinhgiam(1, nam))
                if x == 2:
                    thang2 = utils.luongtoncuoi(thang1, utils.phatsinhtang(2, nam), utils.phatsinhgiam(2, nam))
                if x == 3:
                    thang3 = utils.luongtoncuoi(thang2, utils.phatsinhtang(2, nam), utils.phatsinhgiam(2, nam))
                if x == 4:
                    thang4 = utils.luongtoncuoi(thang3, utils.phatsinhtang(4, nam), utils.phatsinhgiam(4, nam))
                if x == 5:
                    thang5 = utils.luongtoncuoi(thang4, utils.phatsinhtang(5, nam), utils.phatsinhgiam(5, nam))
                if x == 6:
                    thang6 = utils.luongtoncuoi(thang5, utils.phatsinhtang(6, nam), utils.phatsinhgiam(6, nam))
                if x == 7:
                    thang7 = utils.luongtoncuoi(thang6, utils.phatsinhtang(7, nam), utils.phatsinhgiam(7, nam))
                if x == 8:
                    thang8 = utils.luongtoncuoi(thang7, utils.phatsinhtang(8, nam), utils.phatsinhgiam(8, nam))
                if x == 9:
                    thang9 = utils.luongtoncuoi(thang8, utils.phatsinhtang(9, nam), utils.phatsinhgiam(9, nam))
                if x == 10:
                    thang10 = utils.luongtoncuoi(thang9, utils.phatsinhtang(11, nam), utils.phatsinhgiam(11, nam))
                if x == 11:
                    thang11 = utils.luongtoncuoi(thang10, utils.phatsinhtang(11, nam), utils.phatsinhgiam(11, nam))
                if x == 12:
                    thang12 = utils.luongtoncuoi(thang11, utils.phatsinhtang(12, nam), utils.phatsinhgiam(12, nam))
                x += 1

            values = [thang1, thang2, thang3, thang4, thang5, thang6, thang7, thang8, thang9, thang10, thang11, thang12]

            nthang1 = 0;
            nthang2 = 0;
            nthang3 = 0;
            nthang4 = 0;
            nthang5 = 0;
            nthang6 = 0;
            nthang7 = 0;
            nthang8 = 0;
            nthang9 = 0;
            nthang10 = 0;
            nthang11 = 0;
            nthang12 = 0;
            x = 0;
            while x <= 12:
                if x == 1:
                    nthang1 = utils.luongtoncuoi(0, utils.phatsinhtangno(1, nam), utils.phatsinhgiamno(1, nam))
                if x == 2:
                    nthang2 = utils.luongtoncuoi(nthang1, utils.phatsinhtangno(2, nam), utils.phatsinhgiamno(2, nam))
                if x == 3:
                    nthang3 = utils.luongtoncuoi(nthang2, utils.phatsinhtangno(2, nam), utils.phatsinhgiamno(2, nam))
                if x == 4:
                    nthang4 = utils.luongtoncuoi(nthang3, utils.phatsinhtangno(4, nam), utils.phatsinhgiamno(4, nam))
                if x == 5:
                    nthang5 = utils.luongtoncuoi(nthang4, utils.phatsinhtangno(5, nam), utils.phatsinhgiamno(5, nam))
                if x == 6:
                    nthang6 = utils.luongtoncuoi(nthang5, utils.phatsinhtangno(6, nam), utils.phatsinhgiamno(6, nam))
                if x == 7:
                    nthang7 = utils.luongtoncuoi(nthang6, utils.phatsinhtangno(7, nam), utils.phatsinhgiamno(7, nam))
                if x == 8:
                    nthang8 = utils.luongtoncuoi(nthang7, utils.phatsinhtangno(8, nam), utils.phatsinhgiamno(8, nam))
                if x == 9:
                    nthang9 = utils.luongtoncuoi(nthang8, utils.phatsinhtangno(9, nam), utils.phatsinhgiamno(9, nam))
                if x == 10:
                    nthang10 = utils.luongtoncuoi(nthang9, utils.phatsinhtangno(11, nam), utils.phatsinhgiamno(11, nam))
                if x == 11:
                    nthang11 = utils.luongtoncuoi(nthang10, utils.phatsinhtangno(11, nam),
                                                  utils.phatsinhgiamno(11, nam))
                if x == 12:
                    nthang12 = utils.luongtoncuoi(nthang11, utils.phatsinhtangno(12, nam),
                                                  utils.phatsinhgiamno(12, nam))
                x += 1

            valuesno = [nthang1, nthang2, nthang3, nthang4, nthang5, nthang6, nthang7, nthang8, nthang9, nthang10,
                        nthang11,
                        nthang12]
            if int(getthang) == 1:
                tondau = 0
                toncuoi = utils.luongtoncuoi(0, utils.phatsinhtang(getthang, getnam),\
                                             utils.phatsinhgiam(getthang, getnam))
                tondauno = 0
                toncuoino = nthang1
            if int(getthang) == 2:
                tondau = thang1
                toncuoi = utils.luongtoncuoi(thang1, utils.phatsinhtang(getthang, getnam),\
                                             utils.phatsinhgiam(getthang, getnam))
                tondauno = nthang1
                toncuoino= nthang2
            if int(getthang) == 3:
                tondau = thang2
                toncuoi = utils.luongtoncuoi(thang2, utils.phatsinhtang(getthang, getnam),\
                                             utils.phatsinhgiam(getthang, getnam))
                tondauno = nthang2
                toncuoino= nthang3
            if int(getthang) == 4:
                tondau = thang4
                toncuoi = utils.luongtoncuoi(thang3, utils.phatsinhtang(getthang, getnam),\
                                             utils.phatsinhgiam(getthang, getnam))
                tondauno = nthang3
                toncuoino= nthang4
            if int(getthang) == 5:
                tondau = thang4
                toncuoi = utils.luongtoncuoi(thang4, utils.phatsinhtang(getthang, getnam),\
                                             utils.phatsinhgiam(getthang, getnam))
                tondauno = nthang4
                toncuoino= nthang5
            if int(getthang) == 6:
                tondau = thang5
                toncuoi = utils.luongtoncuoi(thang5, utils.phatsinhtang(getthang, getnam),\
                                             utils.phatsinhgiam(getthang, getnam))
                tondauno = nthang5
                toncuoino= nthang6
            if int(getthang) == 7:
                tondau = thang6
                toncuoi = utils.luongtoncuoi(thang6, utils.phatsinhtang(getthang, getnam),\
                                             utils.phatsinhgiam(getthang, getnam))
                tondauno = nthang6
                toncuoino= nthang7
            if int(getthang) == 8:
                tondau = thang7
                toncuoi = utils.luongtoncuoi(thang7, utils.phatsinhtang(getthang, getnam),\
                                             utils.phatsinhgiam(getthang, getnam))
                tondauno = nthang7
                toncuoino= nthang8
            if int(getthang) == 9:
                tondau = thang8
                toncuoi = utils.luongtoncuoi(thang8, utils.phatsinhtang(getthang, getnam),\
                                             utils.phatsinhgiam(getthang, getnam))
                tondauno = nthang8
                toncuoino= nthang9
            if int(getthang) == 10:
                tondau = thang9
                toncuoi = utils.luongtoncuoi(thang9, utils.phatsinhtang(getthang, getnam),\
                                             utils.phatsinhgiam(getthang, getnam))
                tondauno = nthang9
                toncuoino= nthang10
            if int(getthang) == 11:
                tondau = thang10
                toncuoi = utils.luongtoncuoi(thang11, utils.phatsinhtang(getthang, getnam),\
                                             utils.phatsinhgiam(getthang, getnam))
                tondauno = nthang10
                toncuoino= nthang11
            if int(getthang) == 12:
                tondau = thang10
                toncuoi = thang12
                tondauno = nthang11
                toncuoino= nthang12

        return self.render('admin/chart.html', values=values, labels=labels, legend=legend,legends=legends,valuesno=valuesno,list=list,\
                           thang=getthang,tondau=tondau,toncuoi=toncuoi,phatsinh=phatsinh,tondauno=tondauno,\
                           phatsinhno=phatsinhno,toncuoino=toncuoino)


    def is_accessible(self):
        if not current_user.is_active or not current_user.is_authenticated:
            return False

        if current_user.user_role == UserRole.ADMIN or current_user.user_role == UserRole.NHANVIEN:
            return True

        return False


admin.add_view(XemNhanVien(name='Xem thông tin nhân viên',category="Quản Lý Nhân Viên"))
admin.add_view(ThemNhanVien(name='Thêm nhân viên',category="Quản Lý Nhân Viên"))
admin.add_view(BanHang(name='Bán hàng',category="Quản Lý Bán Hàng"))
admin.add_view(xemkhachhang(name ='Xem thông tin khách hàng',category="Quản Lý Khách Hàng"))
admin.add_view(NewModelView(GhiNo, db.session,name ='Xem thông tin nợ',category="Quản Lý Bán Hàng"))
admin.add_view(GhiNoView(name='Ghi nợ',category="Quản Lý Bán Hàng"))
admin.add_view(ThuTienNo(name='Thu nợ',category="Quản Lý Bán Hàng"))
admin.add_view(XemThongTinDonHang(name='Xem thông tin đơn hàng',category="Quản Lý Bán Hàng"))
admin.add_view(BaoCao(name='Thống Kê',category="Quản Lý Bán Hàng"))
admin.add_view(NewModelViewCoTheTao(TheLoai, db.session,name="Thể loại Sách",category="Quản Lý Sách"))
admin.add_view(themsach(name='Thêm sách mới',category="Quản Lý Sách"))
admin.add_view(NewModelView(Sach, db.session,name="Xem sách",category="Quản Lý Sách"))
admin.add_view(NewModelViewCoTheTao(PhieuNhap, db.session,name="Tạo phiếu nhập",category="Quản Lý Sách"))
admin.add_view(chitheiphieunhap(name='Nhập phiếu ',category="Quản Lý Sách"))
admin.add_view(XemChiTietPhieuNhap(name='Xem phiếu nhập ',category="Quản Lý Sách"))
admin.add_view(XemQuyDinh(name='Xem quy định',category="Quy Định"))
admin.add_view(ThayDoiQuyDinh(name='Thay đổi quy định',category="Quy Định"))
admin.add_view(LogoutView(name='Đăng xuất',))