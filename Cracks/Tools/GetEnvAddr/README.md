##Shellcode Details:

This code was taken from Jon Erickson's Hacking: The Art of Exploitation, 1st Ed. I have found it extremely useful for attacks involved in storing shellcode in an environment variable in a attack where a NOP sled is not viable or for a dtors based attack. 

###How to utilize it:

Export your shellcode assembly code to an env variable:

``` 
nasm termFreeWhitespaceFreeTinySC.s
export SHELLCODE=$(cat termFreeWhitespaceFreeTinySC)
``` 

Figure out where the environment variable will be in relation to the program you're going to exploit: 

``` 
./getenvaddr SHELLCODE ./programToBeExploited
``` 