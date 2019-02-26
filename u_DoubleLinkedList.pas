Program single_list;

Uses WinCrt;

Type

Pointer = ^TypeData; {deklarasi type data pointer}

TypeData = Record

{record berisi field nama dan next}

Nama : String; {field nama bertipe string}

Next : Pointer; {field next bertipe pointer}

End;

Var {deklarasi variabel pada program utama}

List : Pointer; {variabel list bertipe pointer}

nama,nama1 : string;

{variabel nama dan nama1 bertipe string}

Jwb,pil : Char; {variabel bantu jwb dan pil bertipe char}

x: integer;

{Procedure Untuk Menambahkan Data(nama)dari Depan}

Procedure TambahDataDepan(Var L : Pointer; X : string);

Var

Baru : Pointer;

Begin

New(Baru);

{mengalokasikan simpul didalam memori digunakan statemen new}

Baru^.Nama := X;

{Proses untuk menambahkan data selanjutnya dari depan}

Baru^.Next := Nil;

if L = Nil then L := Baru

else

Begin

Baru^.Next :=L;

L :=Baru;

End;

End;

{Proceedure Untuk Menambahkan data(nama) dari Belakang}

Procedure TambahDataBelakang(Var L : Pointer; X : string);

Var

Baru,Bantu : Pointer;

Begin

New(Baru);

{mengalokasikan simpul didalam memori digunakan statemen new}

Baru^.Nama := X;

Baru^.Next := Nil;

Bantu := L;

While Bantu^.Next <> Nil Do

Bantu := Bantu^.Next;

Bantu^.Next := Baru;

End;

{Procedure Untuk Menghapus Data dari Depan}

Procedure HapusDepan(Var L : Pointer);

Var

Baru : Pointer;

Begin

Baru := L;

if L = Nil then Writeln('List Kosong…')

{senarai masih kosong}

else

Begin

L := L^.Next; {simpul pertama dihapus}

dispose(Baru);

{ mengalokasikan simpul yang sudah tidak terpakai, maka digunakan statemen dispose }

End;

End;

{Procedure Untuk Menghapus Data dari Belakang}

Procedure HapusBelakang(Var L : Pointer);

Var

Baru,bantu : Pointer;

Begin

Bantu := L; {mencari simpul yang akan dihapus}

if Bantu = Nil then Writeln('List Kosong…')

else

Begin

While Bantu^.Next^.Next <> nil do

{simpul yang akan dihapus ketemu}

Bantu := Bantu^.next; {simpul terakkir dihapus}

New(Baru);

{mengalokasikan simpul didalam memori digunakan statemen new}

Baru := Bantu^.Next;

Bantu^.Next:=nil;

dispose(Baru);

{ mengalokasikan simpul yang sudah tidak terpakai, maka digunakan statemen dispose }

End;

End;

{Procedure Untuk Mencetak Data yang Telah Di inputkan}

Procedure Cetak(L : Pointer);

Var

Bantu : Pointer;

Begin

Bantu := L; {inisialisasi Bantu = list}

While Bantu <> Nil Do

Begin

Write(Bantu^.nama);

Bantu:=Bantu^.Next;

End;

End;

{Program Utama}

Begin

New(List);

{mengalokasikan simpul didalam memori digunakan statemen new}

List:=nil;

{Pembuatan nilai List=nil, pada saat program pertama dijalankan}

Jwb := 'Y';

Writeln('MEMASUKKAN DATA');

Write('Masukkan Nama : '); Readln(nama);

{proses yang dilakukan saat penginputan data yang pertama}

TambahDataDepan(List,nama);

writeln;


x:=0; {inisialisasi variabel n dengan nilai 0}

repeat


writeln('**************************');

writeln('*******MENU PILIHAN*******');

writeln('**************************');

writeln;

writeln('1. Tambah Data Dari Depan');

writeln('2. Tambah Data Dari Belakang');

writeln('3. Hapus Data Depan ');

writeln('4. Hapus Data Belakang ');

writeln('5. Cetak Data ');

writeln('0. Selesai');

writeln;

write('Pilihan Anda : '); readln(pil);

writeln;

case pil of

'1' : Begin

jwb := 'Y';

Writeln('TAMBAH DATA DARI DEPAN');

While UpCase(jwb)='Y' Do

Begin

Write('Masukkan Nama : '); Readln(nama);

TambahDataDepan(List,nama);

{memanggil procedure TambahDataDepan}

Write('Ingin menambah data lagi? [Y/T] ');Readln(jwb);

End;

Cetak(List); {memanggil procedure cetak}

Writeln;

readln;

End;

'2' : Begin

jwb := 'Y';

Writeln('TAMBAH DATA DARI BELAKANG');

While UpCase(jwb)='Y' Do

Begin

Write('Masukkan Nama : '); Readln(nama);

TambahDataBelakang(List,nama);

{memanggil procedure TambahDataBelakang}

Write('Ingin menambah data lagi? [Y/T] ');Readln(jwb);

End;

Cetak(List); {memanggil procedure cetak}

writeln;

readln;

End;

'3' : Begin

Writeln('HAPUS DEPAN ');

HapusDepan(List); {memanggil procedure HapusDepan}

Cetak(List); {memanggil procedure cetak}

Writeln;

readln;

end;

'4' : Begin

Writeln('HAPUS BELAKANG');

HapusBelakang(List);

{memanggil procedure HapusBelakang}

Cetak(List); {memanggil procedure cetak}

Writeln;

readln;

end;

'5' : begin

cetak(list); {memanggil procedure cetak}

writeln;

readln;

end;

'0': writeln('Program selesai, Silahkan kembali ke MENU!');

else

writeln;

writeln('ilih sesuai MENU yang tersedia!'); readln;

end;

until pil='5';

readln;

end.
