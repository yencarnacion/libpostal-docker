#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <libpostal/libpostal.h>

int main(int argc, char **argv) {
    /*
     From http://codereview.stackexchange.com/questions/71970/creating-a-string-from-command-line-arguments
    */
    if(argc == 1) {
        printf("ERROR: Expected at least 1 argument\n");
        return 0;
    }

    int i, v = 1, size = argc - 1;
    int newsize  = 0;

    char *str = (char *)malloc(v);
    strcpy(str,"");

    for(i = 1; i <= size; i++) {
        newsize = newsize + 1 + sizeof(*str) +strlen(argv[i]);
        str = (char *)realloc(str, (newsize));
        strcat(str, argv[i]);
        strcat(str, " ");
    }


    // Setup (only called once at the beginning of your program)
    if (!libpostal_setup() || !libpostal_setup_parser()) {
        exit(EXIT_FAILURE);
    }

    /* 
        From https://github.com/openvenues/libpostal
     */
    address_parser_options_t options = get_libpostal_address_parser_default_options();
    address_parser_response_t *parsed = parse_address(str, options);

    for (size_t i = 0; i < parsed->num_components; i++) {
        printf("%s: %s\n", parsed->labels[i], parsed->components[i]);
    }

    // Free parse result
    address_parser_response_destroy(parsed);

    // Teardown (only called once at the end of your program)
    libpostal_teardown();
    libpostal_teardown_parser();
}
