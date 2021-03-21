from datetime import datetime

from sqlalchemy import Column, Integer, Float, String, \
    Boolean, Enum, ForeignKey, DateTime, Text
from sqlalchemy.orm import relationship
from bookapp import db
from flask_login import UserMixin
import enum


class SaleBase(db.Model):
    __abstract__ = True

    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(50), nullable=False)

    def __str__(self):
        return self.name


class UserRole(enum.Enum):
    ADMIN = 1
    NHANVIEN = 2
    KHACHHANG = 3

    def __str__(self):
        return self.name

class DiaChi(db.Model):
    __tablename__ = 'DiaChi'

    id = Column(Integer, primary_key=True, autoincrement=True)
    sonha = Column(String(100))
    phuongxa = Column(String(100))
    quanhuyen = Column(String(100))
    tinhtp = Column(String(100))

    def __str__(self):
        return self.name


class User(db.Model, UserMixin):
    __tablename__ = 'user'

    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(50), nullable=False)
    email = Column(String(100))
    username = Column(String(50), nullable=False, unique=True)
    password = Column(String(100), nullable=False)
    avatar = Column(String(100))
    active = Column(Boolean, default=True)
    gioitinh = Column(String(100))
    ngaysinh = Column(DateTime)
    ngaytg = Column(DateTime, default=datetime.today())
    sdt = Column(String(100))
    user_role = Column(Enum(UserRole), default=UserRole.KHACHHANG)
    diaChi_id = Column(Integer, ForeignKey(DiaChi.id), nullable=False)
    nhanvien_profiles = db.relationship('NhanVien', uselist=False, back_populates="user")
    khachhang_profiles = db.relationship('KhachHang', uselist=False, back_populates="user")

class NhanVien(db.Model):
    __tablename__ = 'nhanvien'

    cmnd = Column(String(100))
    id = Column(Integer, primary_key=True, autoincrement=True)
    # the one-to-one relation
    user_id = db.Column(Integer, ForeignKey('user.id'))
    donhang = relationship('DonHang', backref="nhanvien", lazy=True)
    user = db.relationship('User', back_populates='nhanvien_profiles')
    khachang = relationship("GhiNo", back_populates="nhanvien")

class DiaChiDatHang(SaleBase):
    __tablename__ = 'diachidathang'

    diachi = Column(String(100))
    sdt = Column(String(100))
    donhang = relationship('DonHang', backref="diachidathang", lazy=True)

    def __str__(self):
        return self.name

class KhachHang(db.Model):
    __tablename__ = 'khachhang'

    id = Column(Integer, primary_key=True, autoincrement=True)
    # the one-to-one relation
    user_id = db.Column(Integer, ForeignKey('user.id'), primary_key=True)
    user = db.relationship('User', back_populates='khachhang_profiles', uselist=False)
    donhang = relationship('DonHang', backref="khachang", lazy=True)
    nhanvien = relationship("GhiNo", back_populates="khachhang")


class TheLoai(SaleBase):
    __tablename__ = 'theloai'

    sach = relationship('Sach', backref="theloai", lazy=True)

class Sach(SaleBase):
    __tablename__ = 'sach'

    tacgia = Column(String(250))
    mota = Column(Text(9000))
    gia = Column(Float)
    nhaxb = Column(String(100))
    namxb = Column(DateTime)
    anh = Column(String(100))
    soluong = Column(Integer)
    theloai_id = Column(Integer, ForeignKey(TheLoai.id), nullable=False)
    donhang = relationship("ChiTietDonHang", back_populates="sach")
    phieunhap = relationship("ChiTietPhieuNhap", back_populates="sach")

class DonHang(db.Model):
    __tablename__ = 'donhang'

    id = Column(Integer, primary_key=True, autoincrement=True)
    ngaythd = Column(DateTime, default=datetime.today())
    isduyetdh = Column(Boolean)
    isthanhtoan = Column(Boolean)
    nv_id = Column(Integer, ForeignKey(NhanVien.id), nullable=False)
    kh_id = Column(Integer, ForeignKey(KhachHang.id), nullable=False)
    dcdh_id = Column(Integer, ForeignKey(DiaChiDatHang.id), nullable=False)
    sach = relationship("ChiTietDonHang", back_populates="donhang")
    ghino = relationship('GhiNo', backref="donhang", lazy=True)

class ChiTietDonHang(db.Model):
    __tablename__ = 'chitietdonhang'

    id = Column(Integer, primary_key=True, autoincrement=True)
    sach_id = Column(Integer, ForeignKey('sach.id'))
    donhang_id = Column(Integer, ForeignKey('donhang.id'))
    soluong = Column(Integer)
    dongia = Column(Float)
    sach = relationship("Sach")
    donhang = relationship("DonHang", back_populates="sach")



class ThanhToanMoMo(db.Model):
    __tablename__ = 'thanhtoanmomo'

    id = Column(Integer, primary_key=True, autoincrement=True)
    dh_id = Column(Integer, ForeignKey(DonHang.id), nullable=False)



class ChiTietPhieuNhap(db.Model):
    __tablename__ = 'chitietphieunhap'

    id = Column(Integer, primary_key=True, autoincrement=True)
    sach_id = Column(Integer, ForeignKey('sach.id'))
    phieunhap_id = Column(Integer, ForeignKey('phieunhap.id'))
    soluong = Column(Integer)
    dongia = Column(Float)
    sach = relationship("Sach")
    phieunhap = relationship("PhieuNhap", back_populates="sach")



class PhieuNhap(db.Model):
    __tablename__ = 'phieunhap'

    id = Column(Integer, primary_key=True, autoincrement=True)
    ngaynhap = Column(DateTime, default=datetime.today())
    sach = relationship("ChiTietPhieuNhap", back_populates="phieunhap")

class GhiNo(db.Model):
    __tablename__ = 'ghino'

    stt = Column(Integer, primary_key=True, autoincrement=True)
    nv_id = Column(Integer, ForeignKey(NhanVien.id), nullable=False)
    kh_id = Column(Integer, ForeignKey(KhachHang.id), nullable=False)
    dh_id = Column(Integer, ForeignKey(DonHang.id), nullable=False)
    ngayno = Column(DateTime, default=datetime.today())
    tienno = Column(Float)
    nhanvien = relationship("NhanVien")
    khachhang = relationship("KhachHang", back_populates="nhanvien")
    thuno = relationship('ThuNo', backref="ghino", lazy=True)
    istrano = Column(Boolean,default=False)

class ThuNo(db.Model):
    __tablename__ = 'thuno'

    stt = Column(Integer, primary_key=True, autoincrement=True)
    ghino_id = Column(Integer, ForeignKey(GhiNo.stt), nullable=False)
    ngaytrano = Column(DateTime, default=datetime.today())
    sotienthu = Column(Float)


if __name__ == '__main__':
    db.create_all()