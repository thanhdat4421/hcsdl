-- ma:                                  CHAR(12)            12 ky tu bao gom A-Z, 0-9, co the chon ma chi dung so
-- ho/ten:                              VARCHAR(20)
-- ten day du:                          VARCHAR(40)
-- email:                               VARCHAR(60)
-- sdt:                                 CHAR(10)
-- dia chi:                             VARCHAR(200)
-- cccd:                                CHAR(12)
-- tien:                                DECIMAL(11, 2)      max = 10^9 = 1 ty

DROP SCHEMA sahafake;

CREATE SCHEMA sahafake;

USE sahafake;

CREATE TABLE chi_nhanh (
    ma                      CHAR(12)        PRIMARY KEY,
    ten                     VARCHAR(40)     NOT NULL,
    email                   VARCHAR(60)     NOT NULL    CHECK (email LIKE '%@%'),
    dia_chi                 VARCHAR(200)    NOT NULL
);

CREATE TABLE sdt_chi_nhanh (
    ma_chi_nhanh            CHAR(12)        NOT NULL,
    sdt                     CHAR(10)        NOT NULL,
    PRIMARY KEY (ma_chi_nhanh, sdt)
);

CREATE TABLE nhan_vien (
    ma                      CHAR(12)        PRIMARY KEY,
    ho                      VARCHAR(20),
    ten                     VARCHAR(20)     NOT NULL,
    ngay_sinh               DATE            NOT NULL,
    email                   VARCHAR(60)     NOT NULL UNIQUE,
    sdt                     CHAR(10)        NOT NULL UNIQUE,
    dia_chi                 VARCHAR(200),
    cccd                    CHAR(12)        NOT NULL UNIQUE,
    luong                   DECIMAL(11, 2)  NOT NULL,
    thoi_gian_bat_dau_lam   DATE            NOT NULL,
    ma_chi_nhanh            CHAR(12)        NOT NULL,
    ma_quan_ly              CHAR(12)        NOT NULL
);

CREATE TABLE thu_ngan (
    ma                      CHAR(12)        NOT NULL,
    ma_quay                 CHAR(12)        NOT NULL,
    doanh_so                DECIMAL(11,2)   NOT NULL
);

CREATE TABLE quan_ly (
    ma                      CHAR(12)        PRIMARY KEY,
    ma_chi_nhanh            CHAR(12)        NOT NULL
);

CREATE TABLE don_hang (
    ma                      CHAR(12)        PRIMARY KEY,
    ngay_tao                DATE            NOT NULL,
    so_luong                INT             NOT NULL,
    tong_tien               DECIMAL(11,2)   NOT NULL,
    ma_thu_ngan             CHAR(12)        NOT NULL,
    ma_thanh_vien           CHAR(12),
    ma_quan_ly              CHAR(12)        NOT NULL
);

CREATE TABLE bao_gom (
    ma_don                  CHAR(12)        NOT NULL,
    ma_quyen_sach           CHAR(12)        NOT NULL,
    PRIMARY KEY (ma_don, ma_quyen_sach)
);

CREATE TABLE don_hang_online (
    ma                      CHAR(12)        PRIMARY KEY,
    ngay_dat                DATE            NOT NULL,
    so_luong                INT             NOT NULL,
    tong_tien               DECIMAL(10,2)   NOT NULL,
    ma_thanh_vien           CHAR(12)        NOT NULL,
    ma_don_offline          CHAR(12)
);

CREATE TABLE bao_gom_online (
    ma_don                  CHAR(12)        NOT NULL,
    ma_dau_sach             CHAR(12)        NOT NULL,
    so_luong                INT             NOT NULL,
    PRIMARY KEY (ma_don, ma_dau_sach)
);

CREATE TABLE thanh_vien (
    cccd                    CHAR(12)        PRIMARY KEY,
    ho                      VARCHAR(20)     NOT NULL,
    ten                     VARCHAR(20)     NOT NULL,
    email                   VARCHAR(60)     NOT NULL UNIQUE,
    sdt                     CHAR(10)        UNIQUE,
    dia_chi                 VARCHAR(200)
);

CREATE TABLE dau_sach (
    ma                      CHAR(12)        PRIMARY KEY,
    ten                     VARCHAR(40)     NOT NULL,
    tac_gia                 VARCHAR(50)     NOT NULL,
    the_loai                VARCHAR(255),
    gia_nhap                DECIMAL(11, 2)  NOT NULL,
    gia_niem_yet            DECIMAL(11, 2)  NOT NULL,
    so_luong                INT             NOT NULL,
    ma_nha_xuat_ban         CHAR(12)        NOT NULL
);

CREATE TABLE quyen_sach (
    ma                      CHAR(12)        NOT NULL,
    ma_dau_sach             CHAR(12)        NOT NULL,
    ma_chi_nhanh            CHAR(12)        NOT NULL,
    PRIMARY KEY (ma, ma_dau_sach)
);

CREATE TABLE nha_xuat_ban (
    ma                      CHAR(12)        PRIMARY KEY,
    ten                     VARCHAR(40)     NOT NULL,
    email                   VARCHAR(60)     NOT NULL UNIQUE,
    sdt                     CHAR(10)        UNIQUE,
    dia_chi                 VARCHAR(200),
    website                 VARCHAR(255)
);


CREATE TABLE voucher (
    ma                      CHAR(12)        PRIMARY KEY,
    thoi_gian_bat_dau_hieu_luc DATE         NOT NULL,
    thoi_gian_het_hieu_luc  DATE,
    ma_don_hang             CHAR(12),
    ma_thanh_vien           CHAR(12)        NOT NULL,
    da_su_dung              BIT             NOT NULL
);

CREATE TABLE giam_gia (
    ma                      CHAR(12)        PRIMARY KEY,
    phan_tram_giam          DECIMAL(3, 2)   NOT NULL,
    giam_toi_da             DECIMAL(11, 2)
);


CREATE TABLE giam_gia_van_chuyen (
    ma                      CHAR(12)        PRIMARY KEY,
    phan_tram_giam          DECIMAL(3, 2)   NOT NULL,
    giam_toi_da             DECIMAL(11, 2)
);


CREATE TABLE ap_dung_cho (
    ma_voucher              CHAR(12)        NOT NULL,
    ma_dau_sach             CHAR(12)        NOT NULL,
    PRIMARY KEY (ma_voucher, ma_dau_sach)
);


-- CREATE INDEX ma_nhan_vien_index ON nhan_vien(ma_nhan_vien);



INSERT INTO chi_nhanh VALUES("CNH000000000", "Đà Nẵng", "lienhe@sahafake.danang.com", "RQQW+HJX, Tăng Nhơn Phú A, Quận 9, Quận 9 Hồ Chí Minh, Vietnam");
INSERT INTO chi_nhanh VALUES("CNH000000001", "Hồ Chí Minh", "lienhe@sahafake.hochiminh.com", "7/11A,Đường 182,Phường Tăng Nhơn Phú A,Quận 9,Tp, Thành phố Hồ Chí Minh 70000, Vietnam");
INSERT INTO sdt_chi_nhanh VALUES("CNH000000000", "0989000000");
INSERT INTO sdt_chi_nhanh VALUES("CNH000000001", "0989000001");
INSERT INTO sdt_chi_nhanh VALUES("CNH000000000", "0989000002");
INSERT INTO sdt_chi_nhanh VALUES("CNH000000001", "0989000003");
INSERT INTO sdt_chi_nhanh VALUES("CNH000000000", "0989000004");
INSERT INTO nhan_vien VALUES("NVI000000000", "Hùng", "Hoàng Thanh", STR_TO_DATE("9-2-1980", "%d-%m-%Y"), "hoang.thanh.hung.4674@sahafake.com", "0989000005", "179 Đ. Lê Văn Việt, Long Thạnh Mỹ, Quận 9, Thành phố Hồ Chí Minh, Vietnam", "070802000000", 35360000, STR_TO_DATE("1-11-2014", "%d-%m-%Y"), "CNH000000000", "NVI000000004");
INSERT INTO nhan_vien VALUES("NVI000000001", "Trâm", "Trần Anh", STR_TO_DATE("4-6-1986", "%d-%m-%Y"), "tran.anh.tram.4675@sahafake.com", "0989000006", "Đường Số 2, Long Thạnh Mỹ, Quận 9, Thành phố Hồ Chí Minh, Vietnam", "070802000001", 35360000, STR_TO_DATE("15-5-2014", "%d-%m-%Y"), "CNH000000001", "NVI000000008");
INSERT INTO nhan_vien VALUES("NVI000000002", "Hỷ", "Nguyễn Thanh", STR_TO_DATE("21-4-1988", "%d-%m-%Y"), "nguyen.thanh.hy.4676@sahafake.com", "0989000007", "262 Hoàng Hữu Nam, Long Thạnh Mỹ, Quận 9, Thành phố Hồ Chí Minh 700000, Vietnam", "070802000002", 4420000, STR_TO_DATE("18-3-2021", "%d-%m-%Y"), "CNH000000000", "NVI000000004");
INSERT INTO nhan_vien VALUES("NVI000000003", "Ly", "Võ Gia", STR_TO_DATE("21-10-1989", "%d-%m-%Y"), "vo.gia.ly.4677@sahafake.com", "0989000008", "Lô I5-3a, 3b, Khu Công Nghệ Cao, Tăng Nhơn Phú A, Thành Phố Thủ Đức, Thành phố Hồ Chí Minh, Vietnam", "070802000003", 17680000, STR_TO_DATE("16-6-2018", "%d-%m-%Y"), "CNH000000001", "NVI000000008");
INSERT INTO nhan_vien VALUES("NVI000000004", "Chỉnh", "Phạm Gia", STR_TO_DATE("4-2-1994", "%d-%m-%Y"), "pham.gia.chinh.4678@sahafake.com", "0989000009", "Hoàng Hữu Nam, Long Thạnh Mỹ, Quận 9, Thành phố Hồ Chí Minh, Vietnam", "070802000004", 35360000, STR_TO_DATE("18-12-2017", "%d-%m-%Y"), "CNH000000000", "NVI000000004");
INSERT INTO nhan_vien VALUES("NVI000000005", "Hiếu", "Lý Gia", STR_TO_DATE("14-2-1984", "%d-%m-%Y"), "ly.gia.hieu.4679@sahafake.com", "0989000010", "4 Số 12, Tăng Nhơn Phú A, Quận 9, Thành phố Hồ Chí Minh, Vietnam", "070802000005", 4420000, STR_TO_DATE("27-12-2020", "%d-%m-%Y"), "CNH000000001", "NVI000000008");
INSERT INTO nhan_vien VALUES("NVI000000006", "San", "Hồ Gia", STR_TO_DATE("18-9-1980", "%d-%m-%Y"), "ho.gia.san.4680@sahafake.com", "0989000011", "VR79+87H, Long Thạnh Mỹ, Quận 9, Thành phố Hồ Chí Minh, Vietnam", "070802000006", 30940000, STR_TO_DATE("9-1-2015", "%d-%m-%Y"), "CNH000000000", "NVI000000004");
INSERT INTO nhan_vien VALUES("NVI000000007", "Biện", "Nguyễn Thanh", STR_TO_DATE("15-4-1982", "%d-%m-%Y"), "nguyen.thanh.bien.4681@sahafake.com", "0989000012", "VR79+87H, Long Thạnh Mỹ, Quận 9, Thành phố Hồ Chí Minh, Vietnam", "070802000007", 4420000, STR_TO_DATE("15-7-2021", "%d-%m-%Y"), "CNH000000000", "NVI000000004");
INSERT INTO nhan_vien VALUES("NVI000000008", "Trước", "Hồ Anh", STR_TO_DATE("5-8-1988", "%d-%m-%Y"), "ho.anh.truoc.4682@sahafake.com", "0989000013", "72 Đ. Lê Văn Việt, Phường Tân Phú, Quận 9, Thành phố Hồ Chí Minh, Vietnam", "070802000008", 39780000, STR_TO_DATE("12-10-2021", "%d-%m-%Y"), "CNH000000001", "NVI000000008");
INSERT INTO nhan_vien VALUES("NVI000000009", "Lan", "Lý Gia", STR_TO_DATE("11-11-1995", "%d-%m-%Y"), "ly.gia.lan.4683@sahafake.com", "0989000014", "15D Số 12, Tăng Nhơn Phú A, Quận 9, Thành phố Hồ Chí Minh, Vietnam", "070802000009", 39780000, STR_TO_DATE("18-8-2013", "%d-%m-%Y"), "CNH000000001", "NVI000000008");
INSERT INTO thu_ngan VALUES("NVI000000009", "QUA000000000", 10178000);
INSERT INTO thu_ngan VALUES("NVI000000002", "QUA000000001", 15207000);
INSERT INTO thu_ngan VALUES("NVI000000007", "QUA000000002", 17120000);
INSERT INTO thu_ngan VALUES("NVI000000005", "QUA000000003", 16573000);
INSERT INTO thu_ngan VALUES("NVI000000006", "QUA000000004", 12646000);
INSERT INTO thu_ngan VALUES("NVI000000003", "QUA000000005", 17590000);
INSERT INTO quan_ly VALUES("NVI000000004", "CNH000000000");
INSERT INTO quan_ly VALUES("NVI000000008", "CNH000000001");
INSERT INTO don_hang VALUES("DHA000000000", STR_TO_DATE("5-10-2021", "%d-%m-%Y"), 2, 4551000, "NVI000000007", "070802000010", "NVI000000004");
INSERT INTO don_hang VALUES("DHA000000001", STR_TO_DATE("4-3-2020", "%d-%m-%Y"), 2, 4106000, "NVI000000009", "070802000012", "NVI000000008");
INSERT INTO don_hang VALUES("DHA000000002", STR_TO_DATE("22-8-2020", "%d-%m-%Y"), 1, 2969000, "NVI000000005", null, "NVI000000008");
INSERT INTO don_hang VALUES("DHA000000003", STR_TO_DATE("11-3-2020", "%d-%m-%Y"), 1, 1582000, "NVI000000002", "070802000011", "NVI000000004");
INSERT INTO don_hang VALUES("DHA000000004", STR_TO_DATE("15-8-2020", "%d-%m-%Y"), 2, 3780000, "NVI000000006", "070802000012", "NVI000000004");
INSERT INTO don_hang VALUES("DHA000000005", STR_TO_DATE("15-1-2020", "%d-%m-%Y"), 1, 1665000, "NVI000000003", null, "NVI000000008");
INSERT INTO don_hang VALUES("DHA000000006", STR_TO_DATE("7-2-2020", "%d-%m-%Y"), 1, 1394000, "NVI000000009", null, "NVI000000008");
INSERT INTO don_hang VALUES("DHA000000007", STR_TO_DATE("4-6-2020", "%d-%m-%Y"), 1, 1582000, "NVI000000003", null, "NVI000000008");
INSERT INTO don_hang VALUES("DHA000000008", STR_TO_DATE("24-4-2021", "%d-%m-%Y"), 1, 941000, "NVI000000005", null, "NVI000000008");
INSERT INTO don_hang VALUES("DHA000000009", STR_TO_DATE("20-7-2021", "%d-%m-%Y"), 1, 1758000, "NVI000000006", "070802000010", "NVI000000004");
INSERT INTO don_hang VALUES("DHA000000010", STR_TO_DATE("3-8-2021", "%d-%m-%Y"), 2, 3809000, "NVI000000007", null, "NVI000000004");
INSERT INTO don_hang VALUES("DHA000000011", STR_TO_DATE("26-10-2020", "%d-%m-%Y"), 2, 2994000, "NVI000000002", null, "NVI000000004");
INSERT INTO don_hang VALUES("DHA000000012", STR_TO_DATE("11-4-2021", "%d-%m-%Y"), 2, 2699000, "NVI000000007", null, "NVI000000004");
INSERT INTO don_hang VALUES("DHA000000013", STR_TO_DATE("27-5-2020", "%d-%m-%Y"), 2, 4551000, "NVI000000005", "070802000011", "NVI000000008");
INSERT INTO don_hang VALUES("DHA000000014", STR_TO_DATE("25-3-2020", "%d-%m-%Y"), 2, 4450000, "NVI000000002", null, "NVI000000004");
INSERT INTO don_hang VALUES("DHA000000015", STR_TO_DATE("13-11-2021", "%d-%m-%Y"), 1, 2868000, "NVI000000009", null, "NVI000000008");
INSERT INTO don_hang VALUES("DHA000000016", STR_TO_DATE("5-7-2020", "%d-%m-%Y"), 1, 811000, "NVI000000003", null, "NVI000000008");
INSERT INTO don_hang VALUES("DHA000000017", STR_TO_DATE("9-9-2020", "%d-%m-%Y"), 2, 2335000, "NVI000000006", null, "NVI000000004");
INSERT INTO don_hang VALUES("DHA000000018", STR_TO_DATE("18-6-2021", "%d-%m-%Y"), 1, 2053000, "NVI000000003", "070802000012", "NVI000000008");
INSERT INTO don_hang VALUES("DHA000000019", STR_TO_DATE("16-6-2021", "%d-%m-%Y"), 2, 3333000, "NVI000000006", null, "NVI000000004");
INSERT INTO bao_gom VALUES("DHA000000008", "QSA000000074");
INSERT INTO bao_gom VALUES("DHA000000016", "QSA000000059");
INSERT INTO bao_gom VALUES("DHA000000009", "QSA000000097");
INSERT INTO bao_gom VALUES("DHA000000012", "QSA000000071");
INSERT INTO bao_gom VALUES("DHA000000019", "QSA000000058");
INSERT INTO bao_gom VALUES("DHA000000005", "QSA000000095");
INSERT INTO bao_gom VALUES("DHA000000004", "QSA000000037");
INSERT INTO bao_gom VALUES("DHA000000000", "QSA000000009");
INSERT INTO bao_gom VALUES("DHA000000011", "QSA000000045");
INSERT INTO bao_gom VALUES("DHA000000001", "QSA000000083");
INSERT INTO bao_gom VALUES("DHA000000002", "QSA000000051");
INSERT INTO bao_gom VALUES("DHA000000003", "QSA000000019");
INSERT INTO bao_gom VALUES("DHA000000017", "QSA000000053");
INSERT INTO bao_gom VALUES("DHA000000006", "QSA000000089");
INSERT INTO bao_gom VALUES("DHA000000007", "QSA000000054");
INSERT INTO bao_gom VALUES("DHA000000010", "QSA000000025");
INSERT INTO bao_gom VALUES("DHA000000014", "QSA000000079");
INSERT INTO bao_gom VALUES("DHA000000018", "QSA000000018");
INSERT INTO bao_gom VALUES("DHA000000015", "QSA000000040");
INSERT INTO bao_gom VALUES("DHA000000013", "QSA000000042");
INSERT INTO bao_gom VALUES("DHA000000019", "QSA000000070");
INSERT INTO bao_gom VALUES("DHA000000010", "QSA000000088");
INSERT INTO bao_gom VALUES("DHA000000012", "QSA000000060");
INSERT INTO bao_gom VALUES("DHA000000004", "QSA000000035");
INSERT INTO bao_gom VALUES("DHA000000014", "QSA000000027");
INSERT INTO bao_gom VALUES("DHA000000013", "QSA000000064");
INSERT INTO bao_gom VALUES("DHA000000011", "QSA000000022");
INSERT INTO bao_gom VALUES("DHA000000001", "QSA000000006");
INSERT INTO bao_gom VALUES("DHA000000000", "QSA000000021");
INSERT INTO bao_gom VALUES("DHA000000017", "QSA000000000");
INSERT INTO don_hang_online VALUES("DHO000000000", STR_TO_DATE("6-9-2021", "%d-%m-%Y"), 11, 16761000, "070802000010", null);
INSERT INTO don_hang_online VALUES("DHO000000001", STR_TO_DATE("11-3-2021", "%d-%m-%Y"), 8, 22944000, "070802000011", null);
INSERT INTO don_hang_online VALUES("DHO000000002", STR_TO_DATE("19-10-2021", "%d-%m-%Y"), 15, 26930000, "070802000012", null);
INSERT INTO don_hang_online VALUES("DHO000000003", STR_TO_DATE("10-3-2021", "%d-%m-%Y"), 8, 11152000, "070802000012", null);
INSERT INTO don_hang_online VALUES("DHO000000004", STR_TO_DATE("12-8-2020", "%d-%m-%Y"), 9, 26721000, "070802000010", null);
INSERT INTO bao_gom_online VALUES("DHO000000000", "DSA000000005", 10);
INSERT INTO bao_gom_online VALUES("DHO000000004", "DSA000000009", 9);
INSERT INTO bao_gom_online VALUES("DHO000000003", "DSA000000006", 8);
INSERT INTO bao_gom_online VALUES("DHO000000002", "DSA000000004", 5);
INSERT INTO bao_gom_online VALUES("DHO000000001", "DSA000000008", 8);
INSERT INTO bao_gom_online VALUES("DHO000000002", "DSA000000007", 10);
INSERT INTO bao_gom_online VALUES("DHO000000000", "DSA000000003", 1);
INSERT INTO thanh_vien VALUES("070802000010", "Tri", "Phan", "phan.tri.4684@gmail.com", "0989000015", "12/86C Đ. Lê Văn Việt, Phường Tân Phú, Quận 9, Thành phố Hồ Chí Minh, Vietnam");
INSERT INTO thanh_vien VALUES("070802000011", "Nham", "Hoàng Thanh", "hoang.thanh.nham.4685@gmail.com", "0989000016", "14A Số 12, Khu Phố 4, Quận 9, Thành phố Hồ Chí Minh 700000, Vietnam");
INSERT INTO thanh_vien VALUES("070802000012", "Trát", "Ngô Anh", "ngo.anh.trat.4686@gmail.com", "0989000017", "Lô I5-1, đường N7, Khu Công Nghệ Cao, Phường Tăng Nhơn Phú A, Hồ Chí Minh, Vietnam");
INSERT INTO dau_sach VALUES("DSA000000000", "Tù nhân của triết lý", "Đỗ Anh Thắng", "the loai", 352000, 1665000, 10, "NXB000000000");
INSERT INTO dau_sach VALUES("DSA000000001", "Ngệ thuật làm tiền", "Trần Anh Bền", "the loai", 1369000, 1758000, 10, "NXB000000001");
INSERT INTO dau_sach VALUES("DSA000000002", "Trên biển", "Trần Gia Tĩnh", "the loai", 1767000, 811000, 10, "NXB000000000");
INSERT INTO dau_sach VALUES("DSA000000003", "Kiếp sinh nhân", "Đặng Gia Hạnh", "the loai", 1233000, 941000, 10, "NXB000000001");
INSERT INTO dau_sach VALUES("DSA000000004", "Tô vẽ bình yên", "Lê Gia Thạnh", "the loai", 1695000, 1280000, 10, "NXB000000001");
INSERT INTO dau_sach VALUES("DSA000000005", "Đọc nhanh cảm xúc và ngôn ngữ cơ thể", "Lý Thanh Phạm", "the loai", 983000, 1582000, 10, "NXB000000000");
INSERT INTO dau_sach VALUES("DSA000000006", "Đam mê để làm gì", "Đặng Anh Dật", "the loai", 1459000, 1394000, 10, "NXB000000000");
INSERT INTO dau_sach VALUES("DSA000000007", "Cây Cam Của Bạn", "Trần Anh Ly", "the loai", 2701000, 2053000, 10, "NXB000000001");
INSERT INTO dau_sach VALUES("DSA000000008", "Giao tiếp tiếng Nhật", "Hồ Anh Nhật", "the loai", 616000, 2868000, 10, "NXB000000001");
INSERT INTO dau_sach VALUES("DSA000000009", "WWW 2021", "Lê Cảnh", "the loai", 138000, 2969000, 10, "NXB000000000");
INSERT INTO quyen_sach VALUES("QSA000000000", "DSA000000006", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000001", "DSA000000002", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000002", "DSA000000003", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000003", "DSA000000001", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000004", "DSA000000000", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000005", "DSA000000008", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000006", "DSA000000007", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000007", "DSA000000009", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000008", "DSA000000004", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000009", "DSA000000005", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000010", "DSA000000009", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000011", "DSA000000003", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000012", "DSA000000006", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000013", "DSA000000000", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000014", "DSA000000008", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000015", "DSA000000001", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000016", "DSA000000002", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000017", "DSA000000004", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000018", "DSA000000007", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000019", "DSA000000005", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000020", "DSA000000001", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000021", "DSA000000009", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000022", "DSA000000007", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000023", "DSA000000004", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000024", "DSA000000002", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000025", "DSA000000003", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000026", "DSA000000006", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000027", "DSA000000008", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000028", "DSA000000000", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000029", "DSA000000005", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000030", "DSA000000008", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000031", "DSA000000000", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000032", "DSA000000006", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000033", "DSA000000001", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000034", "DSA000000003", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000035", "DSA000000002", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000036", "DSA000000004", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000037", "DSA000000009", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000038", "DSA000000007", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000039", "DSA000000005", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000040", "DSA000000008", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000041", "DSA000000001", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000042", "DSA000000009", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000043", "DSA000000000", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000044", "DSA000000004", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000045", "DSA000000003", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000046", "DSA000000007", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000047", "DSA000000005", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000048", "DSA000000006", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000049", "DSA000000002", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000050", "DSA000000004", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000051", "DSA000000009", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000052", "DSA000000001", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000053", "DSA000000003", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000054", "DSA000000005", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000055", "DSA000000000", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000056", "DSA000000008", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000057", "DSA000000006", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000058", "DSA000000007", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000059", "DSA000000002", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000060", "DSA000000003", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000061", "DSA000000006", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000062", "DSA000000009", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000063", "DSA000000000", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000064", "DSA000000005", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000065", "DSA000000001", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000066", "DSA000000007", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000067", "DSA000000008", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000068", "DSA000000004", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000069", "DSA000000002", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000070", "DSA000000004", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000071", "DSA000000001", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000072", "DSA000000002", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000073", "DSA000000006", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000074", "DSA000000003", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000075", "DSA000000008", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000076", "DSA000000009", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000077", "DSA000000007", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000078", "DSA000000000", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000079", "DSA000000005", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000080", "DSA000000005", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000081", "DSA000000004", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000082", "DSA000000001", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000083", "DSA000000007", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000084", "DSA000000003", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000085", "DSA000000009", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000086", "DSA000000002", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000087", "DSA000000000", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000088", "DSA000000008", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000089", "DSA000000006", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000090", "DSA000000009", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000091", "DSA000000005", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000092", "DSA000000002", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000093", "DSA000000004", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000094", "DSA000000007", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000095", "DSA000000000", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000096", "DSA000000006", "CNH000000001");
INSERT INTO quyen_sach VALUES("QSA000000097", "DSA000000001", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000098", "DSA000000003", "CNH000000000");
INSERT INTO quyen_sach VALUES("QSA000000099", "DSA000000008", "CNH000000001");
INSERT INTO nha_xuat_ban VALUES("NXB000000000", "ten NXB", "lienhe.4687@tennxb.com", "0989000018", "Đường Số 2, Long Thạnh Mỹ, Quận 9, Thành phố Hồ Chí Minh, Vietnam", "www.nxb.com");
INSERT INTO nha_xuat_ban VALUES("NXB000000001", "ten NXB", "lienhe.4688@tennxb.com", "0989000019", "Lot I-5C Saigon Hi-Tech Park, Quận 9, Thành phố Hồ Chí Minh, Vietnam", "www.nxb.com");
INSERT INTO voucher VALUES("VOU000000000", STR_TO_DATE("10-2-2021", "%d-%m-%Y"), STR_TO_DATE("5-10-2021", "%d-%m-%Y"), null, "070802000010", False);
INSERT INTO voucher VALUES("VOU000000001", STR_TO_DATE("16-2-2021", "%d-%m-%Y"), STR_TO_DATE("7-4-2021", "%d-%m-%Y"), null, "070802000011", False);
INSERT INTO voucher VALUES("VOU000000002", STR_TO_DATE("11-1-2021", "%d-%m-%Y"), STR_TO_DATE("25-1-2021", "%d-%m-%Y"), null, "070802000012", False);
INSERT INTO giam_gia VALUES("VOU000000001", 0.57, 366000);
INSERT INTO giam_gia_van_chuyen VALUES("VOU000000000", 0.44, 84000);
INSERT INTO giam_gia_van_chuyen VALUES("VOU000000002", 0.17, 48000);
INSERT INTO ap_dung_cho VALUES("VOU000000001", "DSA000000006");
INSERT INTO ap_dung_cho VALUES("VOU000000001", "DSA000000004");
INSERT INTO ap_dung_cho VALUES("VOU000000001", "DSA000000005");


ALTER TABLE
    sdt_chi_nhanh
ADD FOREIGN KEY
    (ma_chi_nhanh) REFERENCES chi_nhanh(ma);

ALTER TABLE
    nhan_vien
ADD FOREIGN KEY
    (ma_quan_ly) REFERENCES nhan_vien(ma),
ADD FOREIGN KEY
    (ma_chi_nhanh) REFERENCES chi_nhanh(ma);

ALTER TABLE
    thu_ngan
ADD FOREIGN KEY
    (ma) REFERENCES nhan_vien(ma);

ALTER TABLE
    quan_ly
ADD FOREIGN KEY
    (ma) REFERENCES nhan_vien(ma),
ADD FOREIGN KEY
    (ma_chi_nhanh) REFERENCES chi_nhanh(ma);

ALTER TABLE
    don_hang
ADD FOREIGN KEY
    (ma_thu_ngan) REFERENCES thu_ngan(ma),
ADD FOREIGN KEY
    (ma_thanh_vien) REFERENCES thanh_vien(cccd),
ADD FOREIGN KEY
    (ma_quan_ly) REFERENCES quan_ly(ma);

ALTER TABLE
    bao_gom
ADD FOREIGN KEY
    (ma_don) REFERENCES don_hang(ma),
ADD FOREIGN KEY
    (ma_quyen_sach) REFERENCES quyen_sach(ma);

ALTER TABLE
    don_hang_online
ADD FOREIGN KEY
    (ma_thanh_vien) REFERENCES thanh_vien(cccd),
ADD FOREIGN KEY
    (ma_don_offline) REFERENCES don_hang(ma);

ALTER TABLE
    bao_gom_online
ADD FOREIGN KEY
    (ma_don) REFERENCES don_hang_online(ma),
ADD FOREIGN KEY
    (ma_dau_sach) REFERENCES dau_sach(ma);

ALTER TABLE
    dau_sach
ADD FOREIGN KEY
    (ma_nha_xuat_ban) REFERENCES nha_xuat_ban(ma);

ALTER TABLE
    quyen_sach
ADD FOREIGN KEY
    (ma_dau_sach) REFERENCES dau_sach(ma),
ADD FOREIGN KEY
    (ma_chi_nhanh) REFERENCES chi_nhanh(ma);

ALTER TABLE
    voucher
ADD FOREIGN KEY
    (ma_don_hang) REFERENCES don_hang(ma),
ADD FOREIGN KEY
    (ma_thanh_vien) REFERENCES thanh_vien(cccd);

ALTER TABLE
    giam_gia
ADD FOREIGN KEY
    (ma) REFERENCES voucher(ma);

ALTER TABLE
    giam_gia_van_chuyen
ADD FOREIGN KEY
    (ma) REFERENCES voucher(ma);

ALTER TABLE
    ap_dung_cho
ADD FOREIGN KEY
    (ma_voucher) REFERENCES voucher(ma),
ADD FOREIGN KEY
    (ma_dau_sach) REFERENCES dau_sach(ma);


