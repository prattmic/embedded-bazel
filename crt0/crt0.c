extern char *_bss_start;
extern char *_bss_end;
extern char *_data_start;
extern char *_data_end;
extern char *_sidata;

extern void main(void);

void _start(void) {
    /* Zero .bss */
    char *p;
    for (p = _bss_start; p < _bss_end; p++) {
        *p = 0;
    }

    /* Copy .data */
    char *s = _sidata;
    char *d;
    for (d = _data_start; p < _data_end; s++, d++) {
        *d = *s;
    }

    main();
    while(1);
}
