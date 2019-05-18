##
## EPITECH PROJECT, 2018
## 
## File description
## 
##
#!/usr/bin/env python3

import sys
from pathlib import Path

class Header:
    def __init__(self, file_name):
        """
        Init function
        """

        self.file_name = file_name
        self.extension = self.load_extension(file_name)

    def load_extension(self, file_name):
        """
        Look for file_name's extension
        """
        return Path(file_name).suffix



    def get_extension(self):
        """
        return file's extension
        """
        return self.extension

    def prepend(self, text):
        """
        Prepend text
        """
        with open(self.file_name, 'r') as orig: data = orig.read()
        with open(self.file_name, 'w') as modif: modif.write(text + data)


class Comment:
    def __init__(self):
        self.comment_start = {
                    '.py': '##',
                    '.c': '/*',
                    '.cpp': '//',
                    '.h': '/*',
                    '.hpp': '//'
        }
        self.comment_mid = {
                    '.py': '##',
                    '.c': '**',
                    '.cpp': '//',
                    '.h': '**',
                    '.hpp': '//'
        }
        self.comment_end = {
                    '.py': '##',
                    '.c': '*/',
                    '.cpp': '//',
                    '.h': '*/',
                    '.hpp': '//'
        }


    def start(self, ext):
        return self.comment_start[ext]


    def mid(self, ext):
        return self.comment_mid[ext]


    def end(self, ext):
        return self.comment_end[ext]


def hello():
    print(hello)


template = [
    '',
    ' EPITECH PROJECT, 2018',
    ' ',
    ' File description',
    ' ',
    ''
]


def modify_template(header):
    global template
    comment = Comment()
    ext = header.get_extension()
    for i in range(1, len(template) - 1):
        template[i] = comment.mid(ext) + template[i]
    template[0] = comment.start(ext) + template[0]
    template[-1] = comment.end(ext)  + template[-1]
    template = '\n'.join(template)
    template += '\n'


def main():
    """
    Main function
    """

    file_name = sys.argv[1]
    header = Header(file_name)
    modify_template(header)
    header.prepend(template)
    return 0


if __name__ == '__main__':
    sys.exit(main())
