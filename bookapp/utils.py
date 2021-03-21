import json, hashlib
from datetime import datetime

from bookapp.models import User, UserRole,TheLoai,Sach,DiaChi,DonHang,KhachHang,DiaChiDatHang,ChiTietDonHang,PhieuNhap,\
    ChiTietPhieuNhap,NhanVien,GhiNo,ThuNo
from bookapp import db
from sqlalchemy import extract
def read_UserRole():

    return UserRole

#kiểm tra phải là adminh k
def check_login_admin(username, password, role=UserRole.ADMIN):
    password = str(hashlib.md5(password.encode('utf-8')).hexdigest())

    user = User.query.filter(User.username == username,
                             User.password == password,
                             User.user_role == role).first()

    return user
#kiểm tra phải là nv
def check_login_nv(username, password, role=UserRole.NHANVIEN):
    password = str(hashlib.md5(password.encode('utf-8')).hexdigest())

    user = User.query.filter(User.username == username,
                             User.password == password,
                             User.user_role == role).first()

    return user
#kiểm tra phải là kh
def check_login_kh(username, password, role=UserRole.KHACHHANG):
    password = str(hashlib.md5(password.encode('utf-8')).hexdigest())

    user = User.query.filter(User.username == username,
                             User.password == password,
                             User.user_role == role).first()

    return user


def get_user_by_id(user_id):
    return User.query.get(user_id)

#logup # them khách hàng
def register_user(name, email, username, password, avatar,gioitinh,ngaysinh,sdt,sonha,phongxa,quanhuyen,tinhtp,user_role):
    password = str(hashlib.md5(password.strip().encode('utf-8')).hexdigest())
    diachi = add_dia_chi_nha(sonha,phongxa,quanhuyen,tinhtp)
    u = User(name=name,
             email=email,
             username=username,
             password=password,
             avatar=avatar,
             gioitinh=gioitinh,
             ngaysinh=ngaysinh,
             sdt=sdt,
             user_role=user_role,
             diaChi_id = diachi.id
             )
    try:
        db.session.add(u)
        db.session.commit()
        return True
    except:
        return False






def read_theloai():
    theloai = TheLoai.query
    return theloai.all()

def read_products(kw=None, theloai_id=None,
                  from_price=None, to_price=None):
    sach = Sach.query

    if theloai_id:
        sach = sach.filter(Sach.theloai_id==theloai_id)

    if kw:
        sach = sach.filter(Sach.name.contains(kw))

    if from_price and to_price:
        sach = sach.filter(Sach.gia.__gt__(from_price),
                                   Sach.gia.__lt__(to_price))

    return sach.all()


def read_diach(user_id =None):
    diachi = DiaChi.query

    return diachi

#doc id sach
def get_book_by_id(sach_id):
    return Sach.query.get(sach_id)

def kiemTraUserName(name):
    user = User.query.all()
    for u in user:
        if u.username == name:
            return True
    return False

def cart_stats(cart):
    if cart is None:
        return 0, 0

    products = cart.values()

    quantity = sum([p['quantity'] for p in products])
    price = sum([p['price']*p['quantity'] for p in products])

    return quantity, price
#tao don hang
def tao_don_hang(kh_id,dc_kh,isthanhtoan):
    h = DonHang(isduyetdh=0,isthanhtoan=isthanhtoan,nv_id = 1,kh_id=kh_id,dcdh_id=dc_kh)
    try:
        db.session.add(h)
        db.session.commit()
        return True
    except:
        return False


def get_id_user(username=None):
    user = User.query.all()
    for u in user:
        if u.username == username:
            return u.id

#taokhachangketnoiban user
def add_kh(user_id):
    kh = KhachHang(user_id=user_id)
    try:
        db.session.add(kh)
        db.session.commit()
        return True
    except:
        return False
#them nhavien
def add_nv(user_id,cmnd):
    nv = NhanVien(user_id=user_id,cmnd=cmnd)
    try:
        db.session.add(nv)
        db.session.commit()
        return True
    except:
        return False


#taodiachigiao hang
def add_dia_chi(name,diachi,sdt):
    dcgh = DiaChiDatHang(name=name,diachi=diachi,sdt=sdt)
    try:
        db.session.add(dcgh)
        db.session.commit()
        return True
    except:
        return False

#donhan
# def add_don_hang(isthanhtoan,nv_id,kh_id,dcdh_id):
#     dh = DonHang(isthanhtoan=isthanhtoan,nv_id=nv_id,kh_id=kh_id,dcdh_id=dcdh_id,isduyetdh=0)
#     try:
#         db.session.add(dh)
#         db.session.commit()
#         return True
#     except:
#         return False


def add_receipt(cart,isthanhtoan,kh_id,name,diachi,sdt,nv_id,isduyet):
    if cart:
        dcgh = DiaChiDatHang(name=name, diachi=diachi, sdt=sdt)
        db.session.add(dcgh)
        db.session.commit()
        dh = DonHang(isthanhtoan=isthanhtoan, nv_id=nv_id, kh_id=kh_id, dcdh_id=dcgh.id, isduyetdh=isduyet,ngaythd=datetime.now())
        db.session.add(dh)
        db.session.commit()
        for p in list(cart.values()):
            detail = ChiTietDonHang(sach_id=int(p["id"]), donhang_id=dh.id, dongia=float(p["price"]), soluong=p["quantity"])
            db.session.add(detail)
            capnhapsoluongsach(int(-p["quantity"]),int(p["id"]))
        db.session.commit()
        return True
    return False


#layidkhachhang
def get_khachhang_by_id(user_id):
    user = KhachHang.query.all()
    for u in user:
        if u.user_id == int(user_id):
            return u.id
#lấy đia chỉ
def get_diachi_by_id(name,sdt,diachi):
    dc = DiaChiDatHang.query.all()
    for d in dc:
        if d.name == name and sdt == sdt and diachi == diachi:
            return d.id
def get_donhanh_by_id(kh_id):
    dh = DonHang.query.all()
    for d in dh:
        if d.kh_id:
            return d.id

#lấy thông tin đơn hàn
def read_donhang(kh_id):
    list = db.session.query(DonHang).join(ChiTietDonHang).join(KhachHang).\
        filter(DonHang.id==ChiTietDonHang.donhang_id,DonHang.kh_id==kh_id).all()
    return list

def read_chitietdonhan(dh_id):

    list = db.session.query(ChiTietDonHang).\
        filter(dh_id==ChiTietDonHang.donhang_id).all()
    return list

def read_tongdh(dh_id):
    list = db.session.query(ChiTietDonHang).\
        filter(dh_id==ChiTietDonHang.donhang_id).all()
    tong = 0
    for l in list:
        tong += l.soluong*l.dongia
    return tong
def read_diachinhanhang(dh_id):

    list = db.session.query(DiaChiDatHang).join(DonHang).\
        filter(DiaChiDatHang.id == DonHang.dcdh_id,DonHang.id==dh_id).all()
    diachi =" "
    for l in list:
        diachi = "Tên: " +l.name + " số điện thoại: " + l.sdt + " Địa chỉ: " + l.diachi
    return diachi

#them dia chi nha
def add_dia_chi_nha(sonha,phuongxa,quanhuyen,tinhtp):
    diachi = DiaChi(sonha=sonha,phuongxa=phuongxa,quanhuyen=quanhuyen,tinhtp=tinhtp)
    try:
        db.session.add(diachi)
        db.session.commit()
        return diachi
    except:
        return False

#them vao phieu thu no và cap nhat da trả nợ
def add_vao_phieu_thuno(idghio,sotien):
    thuno = ThuNo(ghino_id=idghio,sotienthu=sotien)

    try:
        db.session.add(thuno)
        ghino = db.session.query(GhiNo).filter(GhiNo.stt == idghio).first()
        ghino.istrano = True;
        db.session.commit()
        return thuno
    except:
        return False




#doc the loai
def read_the_loai():
    theloai = TheLoai.query()
    return theloai.all()

def get_id_theloai_by_name(name):
    theloai = read_theloai()
    for tl in theloai:
        if tl.name == name:
            return tl.id
    return False
 #them sach

def add_book(name,tacgia,mota,nhaxb,namxb,anh,soluong,theloainame,gia):

     theloai_id = get_id_theloai_by_name(theloainame)
     book = Sach(name=name,tacgia=tacgia,mota=mota,nhaxb=nhaxb,namxb=namxb,anh=anh,soluong=soluong,theloai_id =theloai_id,gia=gia)
     try:
         db.session.add(book)
         db.session.commit()
         return True
     except:
         return False





#cap nhạt so lương sach
def capnhapsoluongsach(them,sach_id):
    sach = Sach.query.filter_by(id=sach_id).first()
    sach.soluong = int(them) + sach.soluong
    db.session.commit()

#lấy thông tin phiếu nhap
def read_phieuNhap():
    phieunhap = PhieuNhap.query
    return phieunhap

#add chi tiet phieu nhap
def add_chi_tiet_phieu_nhap(sach_id,phieu_id,dongia,soluong):
    ctpn = ChiTietPhieuNhap(sach_id=sach_id,phieunhap_id=phieu_id,dongia=dongia,soluong=soluong)
    try:
        db.session.add(ctpn)
        db.session.commit()
        capnhapsoluongsach(soluong,sach_id)
        return True
    except:
        return False

#kiem tra dieu kien nhap
def kiemtraSoLuongNhap(soluong):
    qd = read_data()
    sl = qd['soluongnhap']
    if int(soluong)<=int(sl):
        return False
    return True
def kiemtraSoLuongTon(sach_id):
    s = get_book_by_id(sach_id)
    qd = read_data()
    sl = qd['soluongtonnhap']
    if int(s.soluong)<=int(sl):
        return True
    return False
#lấy id nhân viên
def get_id_nv(user_id):
    nv = NhanVien.query.filter(NhanVien.user_id==user_id).first()
    return nv.id
#xoa du lieu
def delete_data(ban):
    db.session.delete(ban)
    db.session.commit()


#kiem tra du dieu kien de ban hàng không??
def kiemTraSoLuongBan(soluongmua,id):
    sach = Sach.query.filter_by(id=id).first()
    slSauKhiBan = sach.soluong - soluongmua
    qd = read_data()
    sl = qd['soluongtonban']
    if slSauKhiBan >= int(sl):
        return True
    return False
#kiemtra gio hang bán duoc khong
def kiemTragiohang(cart):
    if cart:
        dem = 0
        xacdinh = 0
        for p in list(cart.values()):
            dem = dem +1
            if kiemTraSoLuongBan(p["quantity"],p["id"]):
                xacdinh = xacdinh+1
        if dem==xacdinh:
            return True
    return False

#xem tát cả đơn hàng
def read_xemthongtindonhang():
    list = db.session.query(DonHang)
    return list
#duyet don hang
def duyet_don_hang(dh_id):
    if dh_id:
        dh = DonHang.query.filter(DonHang.id==dh_id).first()
        dh.isduyetdh = 1;
        db.session.commit()
        return True

def kiemTraSoTienNo(dh_id):
    qd = read_data()
    sl = int(qd['sotienno'])
    if  read_tongdh(dh_id)<=sl:
        return True
    return False


#them vao phieu no
def add_ghiNo(nv_id,kh_id,dh_id):
    ghino = GhiNo(nv_id=nv_id,dh_id=dh_id,tienno=read_tongdh(dh_id),kh_id=kh_id)
    try:
        db.session.add(ghino)
        db.session.commit()
        return True
    except:
        return False

#kiem tra khach hang nợ:
def kiemtrakhachhangno(kh_id):
    ghino = GhiNo.query.filter(GhiNo.kh_id==kh_id).all()
    dem = 0
    trno =0
    for no in ghino:
        if no.istrano == True:
            trno += 1
        dem+=+1
    if dem == trno:
        return True
    return False

#doc file json
def read_data(path='data/quydinh.json'):
    with open(path, encoding='utf-8') as f:
        return json.load(f)


#làm báo cáo
#lấy số lượng tồn của tháng 1:

#công thức tính lượng tồn  kho cuối  tháng:
def luongtoncuoi(tondau,phatsinhtang,phatsinhgiam):
    toncuoi = tondau + phatsinhtang - phatsinhgiam
    return toncuoi
#công thức tính lượng phát sinh tang
def phatsinhtang(thang,nam):
    list = db.session.query(ChiTietPhieuNhap).join(PhieuNhap). \
        filter(extract('month',PhieuNhap.ngaynhap) == thang).filter(
               extract('year',PhieuNhap.ngaynhap) == nam ).all()
    phatsinhtang = 0;
    for x in list:
        phatsinhtang = phatsinhtang + x.soluong
        #lấy được số lượng nhập của mỗi sản phẩm trong tháng
    return phatsinhtang

#công thức tính phát sinh giảm cái này khách mua trừ sớ lượng ra nè
def phatsinhgiam(thang,nam):
    list = db.session.query(ChiTietDonHang).join(DonHang). \
        filter(extract('month',DonHang.ngaythd) == thang).filter(
               extract('year',DonHang.ngaythd) == nam ).all()
    phatsinhgiam = 0;
    for x in list:
        phatsinhgiam = phatsinhgiam + x.soluong
        #lấy được số lượng nhập của mỗi sản phẩm trong tháng
    return phatsinhgiam

#tinh công nợ khách hàng
#công thức tính lượng tồn  kho cuối  tháng:
def luongtoncuoino(tondau,phatsinhtang,phatsinhgiam):
    toncuoi = tondau + phatsinhtang - phatsinhgiam
    return toncuoi
#công thức tính lượng phát sinh tang
def phatsinhtangno(thang,nam):
    list = db.session.query(GhiNo). \
        filter(extract('month',GhiNo.ngayno) == thang).filter(
               extract('year',GhiNo.ngayno) == nam ).all()
    phatsinhtang = 0;
    for x in list:
        phatsinhtang = phatsinhtang + x.tienno
        #lấy được số lượng nhập của mỗi sản phẩm trong tháng
    return phatsinhtang

#công thức tính phát sinh giảm cái này khách mua trừ sớ lượng ra nè
def phatsinhgiamno(thang,nam):
    list = db.session.query(ThuNo). \
        filter(extract('month',ThuNo.ngaytrano) == thang).filter(
               extract('year',ThuNo.ngaytrano) == nam ).all()
    phatsinhgiam = 0;
    for x in list:
        phatsinhgiam = phatsinhgiam + x.sotienthu
        #lấy được số lượng nhập của mỗi sản phẩm trong tháng
    return phatsinhgiam








