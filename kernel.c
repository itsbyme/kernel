
#define STDOUT 0xb8000

int clean(char *vptr)
{
    for (unsigned int i = 0; i < 80 * 25 * 2; i += 2) {
        vptr[i] = ' ';
        vptr[i + 1] = 0x07;
    }
    return 0;
}

int print(const char *msg, char *vptr)
{
    for (unsigned int i = 0, j = 0; msg[i] != '\0'; ++i, j += 2) {
        vptr[j] = msg[i];
        vptr[j + 1] = 0x07;
    }
    return 0;
}

int kmain(void)
{
    const char *kernel_msg = "kernel loaded";
    char *vptr = (char *) STDOUT;

    clean(vptr);
    print(kernel_msg, vptr);

    return 0;
}
