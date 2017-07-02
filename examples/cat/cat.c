// cat - read and output files

/*
Copyright (c) 2014, Josh Hartigan
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this
  list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice,
  this list of conditions and the following disclaimer in the documentation
  and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

#include <stdio.h>

#define MAX_STRING_SIZE 1024
#define MAX_LINE_SIZE 1000

void output_file(FILE *in, FILE *out);

int main(int argc, char **argv) {
  int arg_count = argc;
  char **arguments = argv;

  if (arg_count == 1) {
    output_file(stdin, stdout);
    return 0;
  }

  FILE *read_file;
  while (--arg_count > 0) {
    read_file = fopen(*++arguments, "r");

    if (read_file == NULL) {
      perror(*arguments);
      return 1;
    }

    output_file(read_file, stdout);
    fclose(read_file);
  } // end while

}

void output_file(FILE *in, FILE *out) {
  static char buffer[MAX_STRING_SIZE];

  size_t size; // Number of bytes read by fread()
  while ( (size = fread(buffer, 1, MAX_STRING_SIZE, in) ) != 0) {
    fwrite(buffer, 1, size, out);
  }
}
