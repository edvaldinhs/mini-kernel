<p id="title" align="center">
  <a href="#title">
    <img width="240" src="https://i.imgur.com/G6R78PP.png">
    <h1 align="center">Mini Kernel</h1>
  </a>
</p>

<p align="center">

  <a aria-label="Made By Edvaldo" href="https://github.com/edvaldinhs/">
    <img src="https://img.shields.io/badge/MADE%20BY%20Edvaldo-000000.svg?style=for-the-badge&labelColor=000&logo=starship&logoColor=fff&logoWidth=20">
  </a>
</p>

<p align="center">A mini kernel project for fun</p>

<br>

## 🧪&nbsp; Technologies

This project was developed with the following technologies:

- [YDE](https://github.com/edvaldinhs/yde-language/)
- [NASM](https://www.nasm.us/doc/nasm02.html)
- [GNU-LINKER](https://sourceware.org/binutils/docs/ld.pdf)
- [QEMU](https://www.qemu.org/)

<br>

## 🎲&nbsp; About

A custom-built kernel that uses a original programming language currently in development. The kernel is meant to be simple and only built for educational and entertainment purposes.

<br>

## 🧑🏻‍💻&nbsp; Getting Started

You will need to download some libs before running

### Arch
```bash
$ sudo pacman -S nasm
$ sudo pacman -S qemu
$ sudo pacman -S virt-viewer
```

Also You'll need to acess the yde compiler project and follow the steps to build the compiler:

[yde-language.git](https://github.com/edvaldinhs/yde-language.git)


### Build
You can use the setup.sh to build and use the remote-viewer as front:

```bash
$ ./setup.sh
$ remote-viewer vnc://127.0.0.1:5900
```

Or build the project manually:

Change "yde" to the path of the built yde file from, or create an alias.

```bash
$ mkdir build
$ yde ./src/kernel.yde -o ./build/kernel
$ nasm -f elf32 ./boot/boot.s -o ./build/boot.o
$ ld -m elf_i386 -T ./boot/linker.ld -o ./build/myos.bin ./build/boot.o ./build/kernel.o
$ qemu-system-x86_64 -kernel ./build/myos.bin
```

Then use the remote-viewer
```bash
$ remote-viewer vnc://127.0.0.1:5900
```
<br>

## Example

After compiling, you should see something like this:

<img width="908" alt="image" src="https://github.com/user-attachments/assets/7b92de0b-f993-4fa0-a1b8-2601178b665e" />

<br>
<br>

## 💻&nbsp; Project

Building a kernel from scratch in my own programming language.

<br>

## 🧑&nbsp; Authors

<p align="center">
    <img width="20%" src="https://github.com/edvaldinhs.png" alt="Edvaldo Henrique">
  <p align="center">
    Edvaldo Henrique
  </p >
</p>
