# Week 14 Log
## Tanggal : 20-22 Desember 2020
### Apa yang saya pelajari :
Minggu ini, saya mengerjakan WS lebih ke arah untuk membantu pengerjaan tugas kelompok. Pada WS ini, saya menemukan **HD Audio** driver yang bernama snd_hda_intel yang kemungkinan besar berguna untuk proyek motion-sensor alarm kelompok saya (salah satu driver yang berhubungan selain yang saya gunakan untuk WS adalah driver untuk webcam). Selain berdiskusi dengan kelompok untuk menemukannya, saya mencoba mengkonfirmasinya dengan menggunakan **lsmod**, yang berfungsi untuk me-list semua driver module yang terpasang di kernel, dan saya mencoba mencari module yang berhubungan dengan sound, dan saya memulai menelusuri dependency dari snd dan ledtrig_audio sampai saya menemukan snd_hda_driver. Selain dari cara tersebut, saya juga mencari dokumentasi HD Audio Driver di kernel.org.

Sepemahaman saya, beberapa kapabilitas yang bisa saya gunakan di driver tersebut adalah:
- enable akan kami atur sesuai kapan audio interface diperlukan
- power_save akan kami matikan untuk meningkatkan kinerja overall HD Audio device
<!-- end of list -->

Untuk ke depannya, saya dan kelompok berencana untuk mempelajari device driver ini lebih lanjut untuk mengetahui apa saja yang perlu kami ubah untuk menyesuaikan drivernya dengan keperluan proyek kelompok.

### Apa yang belum saya pahami :
Saya masih mengalami kendala dalam memahami kapabilitas-kapabilitas dari driver saya, karena saya masih bertemu dengan terms yang masih asing bagi saya (walaupun masih bisa saya cari artinya melalui google). Selain itu, saya juga sebenarnya masih sangat kesulitan dalam melakukan navigasi di kernel.org karena saya tidak mengerti bagaimana cara mereka mengorganisir informasi-informasi yang relevan, dan saat saya temukan 1 halaman dokumentasi bisa sangat panjang dan cukup sulit menemukan informasinya.