assembly-scan-and-print
Project Description

This is a simple assembly program written for x86_64 Linux environments.
It prompts the user to enter their name and age, then prints the entered information back to the console.
The program demonstrates basic input/output operations using Linux syscalls and simple string handling in assembly language.

Expected output:

![Captura de tela 2025-07-05 051301](https://github.com/user-attachments/assets/2d99f8b2-4ae2-4496-9632-26548a98e65b)


How to Build and Run

This project uses NASM and ld on a Linux environment.
If you are on Windows, use WSL (Windows Subsystem for Linux) to run the commands.

Steps:

Open your WSL terminal.

Navigate to the project directory, for example:

cd /mnt/c/Users/Natan/Downloads

Build the program by running the build script:

./build.sh

Run the executable:

./print-data

Como Compilar e Rodar

Este é um programa simples em assembly para ambientes Linux x86_64.
Ele solicita que o usuário insira seu nome e idade, e depois exibe essas informações no console.
O programa demonstra operações básicas de entrada/saída usando syscalls Linux e manipulação simples de strings em assembly.

Passos:

Abra o terminal do WSL.

Navegue até a pasta do projeto, por exemplo:

cd /mnt/c/Users/Natan/Downloads

Compile o programa executando o script:

./build.sh

Execute o programa:

./print-data

Let me know if you want it in any other format!
