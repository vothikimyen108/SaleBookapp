from flask import render_template,request,redirect,url_for,session,jsonify
from bookapp import decorator
from bookapp import app,utils,login
from flask_login import login_user,logout_user
import hashlib, os,json
from bookapp.admin import *
from bookapp.models import User,DiaChi,Sach
from bookapp import db
from bookapp import decorator
@app.route("/")
def index():
    userrole = utils.UserRole
    theloai = utils.read_theloai()
    sach = Sach.query
    quan, price = utils.cart_stats(session.get('cart'))
    cart_info = {
        'total_quantity': quan,
        'total_amount': price
    }
    return render_template('index.html',
                           userrole=userrole,theloai=theloai,sach=sach,cart_info=cart_info)

#@app.route('/admin')
#def indexad():
    #userrole = utils.UserRole
    #return render_template('admin/index.html',
                           #userrole=userrole)

#login
@login.user_loader
def get_user(user_id):
    return utils.get_user_by_id(user_id=user_id)


#Dangnhap

@app.route('/loginlogup', methods=['get', 'post'])
def login_usr():
    err_msg = ""
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password', '')
        user = utils.check_login_kh(username=username,password=password)
        admin = utils.check_login_admin(username=username,password=password)
        nv = utils.check_login_nv(username=username,password=password)
        if user:
            login_user(user=user)
            return  redirect("/")
        elif admin:
            login_user(user=admin)
            return redirect("/admin")
        elif nv:
            login_user(user=nv)
            return redirect("/admin")
        else:
            err_msg = "Sai tên đăng nhập hoặc mật khẩu"


    return render_template('login.html',err_msg=err_msg)


@app.route('/dangki', methods=['get', 'post'])
def register():

    err_msg = ""
    if request.method == 'POST':

        password = request.form.get('password')
        confirm = request.form.get('confirm-password')
        if password == confirm:
            name = request.form.get('name')
            email = request.form.get('email')
            username = request.form.get('username')
            ngaysinh = request.form.get('ngaysinh')
            gioitinh = request.form.get('gender')
            sdt = request.form.get('sdt')
            avatar_path = 'images/upload/abc.jpg'
            if utils.kiemTraUserName(username):
                err_msg = "Tên đăng nhập đã được sử dụng"
            elif utils.register_user(name=name, username=username, password=password,
                                   email=email, avatar=avatar_path,gioitinh=gioitinh,ngaysinh=ngaysinh,sdt=sdt,sonha="371",phongxa="phường 7",quanhuyen="quận Gò Vấp",tinhtp="Hồ Chí Minh",user_role=utils.UserRole.KHACHHANG):
                 u =  utils.get_id_user(username)
                 utils.add_kh(u)
                 err_msg = "Tạo tài khoản thành công"
                #return redirect('/loginlogup')
        else:
            err_msg = "Mật khẩu không khớp vui lòng thử lại"

    return render_template('dangki.html',err_msg=err_msg)


@app.route('/logout')
def logout_usr():
    logout_user()
    return redirect(url_for('index'))

@app.route('/sach',methods=['get', 'post'])
def sachList():
    userrole = utils.UserRole
    theloai = utils.read_theloai()
    quan, price = utils.cart_stats(session.get('cart'))
    cart_info = {
        'total_quantity': quan,
        'total_amount': price
    }
    kw = request.args.get("kw")
    theloai_id = request.args.get("theloai_id")
    from_price = request.args.get("from_price")
    to_price = request.args.get("to_price")

    sach = utils.read_products(theloai_id=theloai_id,
                                   kw=kw,
                                   from_price=from_price,
                                   to_price=to_price)


    return render_template('sach.html',
                           userrole=userrole,theloai=theloai,sach=sach,cart_info=cart_info)

UPLOAD_FOLDER = './static/images/upload'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

@app.route('/profile',methods=['get', 'post'])
@decorator.login_required
def profile():
    err_msg = ""
    userrole = utils.UserRole
    diachi = utils.read_diach()
    quan, price = utils.cart_stats(session.get('cart'))
    cart_info = {
        'total_quantity': quan,
        'total_amount': price
    }
    if request.method == 'POST':
        file = request.files['file']
        if file.filename == "":
            user_anh = request.form.get("user_anh")
            avatar_path = user_anh;
        else:
            path = os.path.join(app.config['UPLOAD_FOLDER'], file.filename)
            file.save(path)
            avatar_path = 'images/upload/%s' % file.filename
        ngaysinh = request.form.get('ngaysinh')
        gioitinh = request.form.get('gender')
        sdt = request.form.get('sdt')
        user_id = request.form.get("user_id")
        updatedname = request.form.get("name")
        user= User.query.filter_by(id=user_id).first()
        user.name = updatedname
        user.avatar =avatar_path
        user.ngaysinh = ngaysinh
        user.sdt = sdt
        user.gioitinh = gioitinh
        db.session.commit()

    return render_template('profile.html',userrole=userrole,diachi=diachi,err_msg=err_msg,cart_info=cart_info)


#updatdiachi
@app.route('/profile/suadiachi',methods=['get', 'post'])
@decorator.login_required
def suadiachi():
    err_msg = ""
    userrole = utils.UserRole
    diachi = utils.read_diach()
    quan, price = utils.cart_stats(session.get('cart'))
    cart_info = {
        'total_quantity': quan,
        'total_amount': price
    }
    if request.method == 'POST':
        err_msg = "aaao";
        sonha = request.form.get('sonha')
        phuongxa = request.form.get('phuongxa')
        quanhuyen = request.form.get('quanhuyen')
        tinh = request.form.get('tinhtp')
        err_msg = "aaa";
        user_diachi = request.form.get('user_diachi')
        if(sonha=="" or phuongxa == "" or quanhuyen==""):
            err_msg = "Hãy Nhập số nhà hoặc phường xã hoặc quận huyện";
        else:
            diachi = DiaChi.query.filter_by(id=user_diachi).first()
            diachi.sonha = sonha
            diachi.phuongxa = phuongxa
            diachi.tinhtp = tinh
            diachi.quanhuyen = quanhuyen
            db.session.commit()
            return redirect(url_for('profile'))
    return render_template('suadiachi.html',userrole=userrole,diachi=diachi,err_msg=err_msg,cart_info=cart_info)

@app.route('/profile/xemdonhang',methods=['get', 'post'])
def xemdonhang():
    err_msg = ""
    userrole = utils.UserRole
    diachi = utils.read_diach()
    quan, price = utils.cart_stats(session.get('cart'))
    cart_info = {
        'total_quantity': quan,
        'total_amount': price
    }
    listdh = utils.read_donhang(utils.get_khachhang_by_id(current_user.id))
    return render_template('xemdonhang.html',userrole=userrole,diachi=diachi,err_msg=err_msg,cart_info=cart_info,listdh=listdh)

@app.route('/profile/xemdonhang/<int:dh_id>',methods=['get', 'post'])
def xemthongtinchitiet(dh_id):
    err_msg = ""
    userrole = utils.UserRole
    diachi = utils.read_diach()
    quan, price = utils.cart_stats(session.get('cart'))
    cart_info = {
        'total_quantity': quan,
        'total_amount': price
    }
    sach = utils.read_products()
    tong = utils.read_tongdh(dh_id)
    ctdh = utils.read_chitietdonhan(dh_id)
    dcnh = utils.read_diachinhanhang(dh_id)
    return render_template('chitietdonhang.html',userrole=userrole,diachi=diachi,err_msg=err_msg,cart_info=cart_info,ctdh=ctdh,sach=sach,tong=tong,dcnh=dcnh)




@app.route("/sach/<int:sach_id>")
def book_detail(sach_id):
    sach = utils.get_book_by_id(sach_id)
    userrole = utils.UserRole
    diachi = utils.read_diach()
    quan, price = utils.cart_stats(session.get('cart'))
    cart_info = {
        'total_quantity': quan,
        'total_amount': price
    }
    return render_template('sachdetail.html',
                          sach_id=sach,userrole=userrole,diachi=diachi,cart_info=cart_info)

@app.route("/cart",methods=['get', 'post'])
def cart():
    err_msg = ""
    if request.method == 'POST':
        name = request.form.get('name')
        sdt = request.form.get('sdt')
        diachi = request.form.get('diachi')
        userid = request.form.get('userid')
        thanhtoan = request.form.get('thanhtoan')
        if thanhtoan == 'momo':
            kh_id = utils.get_khachhang_by_id(userid)
            if utils.kiemTragiohang(session.get('cart')):
                if utils.add_receipt(session.get('cart'), 1, kh_id, name, diachi, sdt,1,0):
                    del session['cart']
                    err_msg ="đặt hàng thành công! kiểm tra trong đơn hàng"
            else:
                err_msg = "Sản phẩm bạn mua đã hết! vui lòng mua lại lần sau"
        else:
            kh_id = utils.get_khachhang_by_id(userid)
            if utils.kiemTragiohang(session.get('cart')):
                if utils.add_receipt(session.get('cart'), 0, kh_id, name, diachi, sdt,1,0):
                    del session['cart']
                    err_msg ="đặt hàng thành công! kiểm tra trong đơn hàng"
            else:
                err_msg = "Sản phẩm bạn mua đã hết! vui lòng mua lại lần sau"

    userrole = utils.UserRole
    diachi = utils.read_diach()
    quan, price = utils.cart_stats(session.get('cart'))
    sach = Sach.query
    cart_info = {
        'total_quantity': quan,
        'total_amount': price
    }
    return render_template('cart.html',
                          userrole=userrole,diachi=diachi,cart_info=cart_info,sach=sach,err_msg=err_msg)

@app.route('/api/cart', methods=['post'])
def add_to_cart():
    if 'cart' not in session:
        session['cart'] = {}

    data = request.json
    product_id = str(data.get('id'))
    product_name = data.get('name')
    price = data.get('price')
    sl = data.get('quantity')
    cart = session['cart']
    if product_id in cart: # nếu sp đã có trong giỏ
        quan = cart[product_id]['quantity']
        cart[product_id]['quantity'] = int(quan) + sl
        if cart[product_id]['quantity'] <= 0:
            cart[product_id]['quantity'] = 1;
    else: # sp chưa có trong giỏ
        cart[product_id] = {
            "id": product_id,
            "name": product_name,
            "price": price,
            "quantity": sl
        }

    session['cart'] = cart
    quan, price = utils.cart_stats(session['cart'])

    return jsonify({
        'total_quantity': quan,
        'total_amount': price
    })


#xoa san pham khoi gio hang
@app.route('/cart/delete/<int:id>')
def delete_product(id):
    try:
        session.modified = True
        for key, item  in session['cart'].items():
            if int(key) == id:
                session['cart'].pop(key,None)
                return redirect(url_for('cart'))
    except Exception as e:
        print(e)
        return redirect(url_for('cart'))

@app.route('/admin/delete/<int:id>')
def delete_productadmin(id):
    try:
        session.modified = True
        for key, item  in session['cart'].items():
            if int(key) == id:
                session['cart'].pop(key,None)
                return redirect(url_for('banhang.banhang'))
    except Exception as e:
        print(e)
        return redirect(url_for('banhang.banhang'))

@app.route('/admin/duyetonhang/<int:id>')
def duyetdonhang_ad(id):
    try:
        if(utils.duyet_don_hang(id)):
            return redirect(url_for('xemthongtindonhang.thongtindonhang'))
    except Exception as e:
        print(e)
        return redirect(url_for('xemthongtindonhang.thongtindonhang'))


#test bản đồ
# @app.route("/simple_chart")
# def chart():
#     legend = 'Monthly Data'
#     labels = ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6", "Tháng 7", "Tháng 8","Tháng 9","Tháng 10",\
#               "Tháng 11","Tháng 12"]
#     a = 5
#     nam = 2020
#
#     thang1 = 0;
#     thang2 = 0;
#     thang3 = 0;
#     thang4 = 0;
#     thang5 = 0;
#     thang6 =0;
#     thang7 =0;
#     thang8 = 0;
#     thang9 =0;
#     thang10 = 0;
#     thang11 =0;
#     thang12 =0;
#     x = 0;
#     while x <= 12:
#         if x == 1:
#             thang1 = utils.luongtoncuoi(0,utils.phatsinhtang(1,nam),utils.phatsinhgiam(1,nam))
#         if x == 2:
#             thang2 = utils.luongtoncuoi(thang1,utils.phatsinhtang(2,nam),utils.phatsinhgiam(2,nam))
#         if x == 3:
#             thang3 = utils.luongtoncuoi(thang2,utils.phatsinhtang(2,nam),utils.phatsinhgiam(2,nam))
#         if x == 4:
#             thang4 = utils.luongtoncuoi(thang3,utils.phatsinhtang(4,nam),utils.phatsinhgiam(4,nam))
#         if x == 5:
#             thang5 = utils.luongtoncuoi(thang4,utils.phatsinhtang(5,nam),utils.phatsinhgiam(5,nam))
#         if x == 6:
#             thang6 = utils.luongtoncuoi(thang5,utils.phatsinhtang(6,nam),utils.phatsinhgiam(6,nam))
#         if x == 7:
#             thang7 = utils.luongtoncuoi(thang6,utils.phatsinhtang(7,nam),utils.phatsinhgiam(7,nam))
#         if x == 8:
#             thang8 = utils.luongtoncuoi(thang7,utils.phatsinhtang(8,nam),utils.phatsinhgiam(8,nam))
#         if x == 9:
#             thang9 = utils.luongtoncuoi(thang8,utils.phatsinhtang(9,nam),utils.phatsinhgiam(9,nam))
#         if x == 10:
#             thang10 = utils.luongtoncuoi(thang9,utils.phatsinhtang(11,nam),utils.phatsinhgiam(11,nam))
#         if x == 11:
#             thang11 = utils.luongtoncuoi(thang10,utils.phatsinhtang(11,nam),utils.phatsinhgiam(11,nam))
#         if x == 12:
#             thang12 = utils.luongtoncuoi(thang11,utils.phatsinhtang(12,nam),utils.phatsinhgiam(12,nam))
#         x+=1
#
#     values = [thang1,thang2,thang3,thang4,thang5,thang6,thang7,thang8,thang9,thang10,thang11,thang12]
#
#     nthang1 = 0;
#     nthang2 = 0;
#     nthang3 = 0;
#     nthang4 = 0;
#     nthang5 = 0;
#     nthang6 =0;
#     nthang7 =0;
#     nthang8 = 0;
#     nthang9 =0;
#     nthang10 = 0;
#     nthang11 =0;
#     nthang12 =0;
#     x = 0;
#     while x <= 12:
#         if x == 1:
#             nthang1 = utils.luongtoncuoi(0,utils.phatsinhtangno(1,nam),utils.phatsinhgiamno(1,nam))
#         if x == 2:
#             nthang2 = utils.luongtoncuoi(nthang1,utils.phatsinhtangno(2,nam),utils.phatsinhgiamno(2,nam))
#         if x == 3:
#             nthang3 = utils.luongtoncuoi(nthang2,utils.phatsinhtangno(2,nam),utils.phatsinhgiamno(2,nam))
#         if x == 4:
#             nthang4 = utils.luongtoncuoi(nthang3,utils.phatsinhtangno(4,nam),utils.phatsinhgiamno(4,nam))
#         if x == 5:
#             nthang5 = utils.luongtoncuoi(nthang4,utils.phatsinhtangno(5,nam),utils.phatsinhgiamno(5,nam))
#         if x == 6:
#             nthang6 = utils.luongtoncuoi(nthang5,utils.phatsinhtangno(6,nam),utils.phatsinhgiamno(6,nam))
#         if x == 7:
#             nthang7 = utils.luongtoncuoi(nthang6,utils.phatsinhtangno(7,nam),utils.phatsinhgiamno(7,nam))
#         if x == 8:
#             nthang8 = utils.luongtoncuoi(nthang7,utils.phatsinhtangno(8,nam),utils.phatsinhgiamno(8,nam))
#         if x == 9:
#             nthang9 = utils.luongtoncuoi(nthang8,utils.phatsinhtangno(9,nam),utils.phatsinhgiamno(9,nam))
#         if x == 10:
#             nthang10 = utils.luongtoncuoi(nthang9,utils.phatsinhtangno(11,nam),utils.phatsinhgiamno(11,nam))
#         if x == 11:
#             nthang11 = utils.luongtoncuoi(nthang10,utils.phatsinhtangno(11,nam),utils.phatsinhgiamno(11,nam))
#         if x == 12:
#             nthang12 = utils.luongtoncuoi(nthang11,utils.phatsinhtangno(12,nam),utils.phatsinhgiamno(12,nam))
#         x+=1
#
#     valuesno = [nthang1,nthang2,nthang3,nthang4,nthang5,nthang6,nthang7,nthang8,nthang9,nthang10,nthang11,nthang12]
#
#
#
#     return render_template('chart.html', values=values, labels=labels, legend=legend,valuesno=valuesno)





if __name__ == "__main__":
    app.run(debug=True)