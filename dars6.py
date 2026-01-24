from PyQt5.QtWidgets import QApplication, QWidget, QLabel, QLineEdit, QPushButton, QHBoxLayout, QVBoxLayout


class   Mywindow(QWidget):
    def __init__(self):
        super().__init__()


        self.v_main = QVBoxLayout()
        self.h_bir = QHBoxLayout()
        self.h_iki = QHBoxLayout()
        self.h_uch = QHBoxLayout()
        self.display = QLineEdit()
        


        self.btn_1 = QPushButton('1')
        self.btn_2 = QPushButton('2')
        self.btn_3 = QPushButton('3')
        self.btn_4 = QPushButton('4')
        self.btn_5 = QPushButton('5')
        self.btn_6 = QPushButton('6')
        self.btn_7 = QPushButton('7')
        self.btn_8 = QPushButton('8')
        self.btn_9 = QPushButton('9')
        self.btn_0 = QPushButton('0')
        self.btn_plus = QPushButton('+')
        self.btn_minus = QPushButton('-')
        self.btn_kop = QPushButton('*')
        self.btn_bol = QPushButton('/')
        self.btn_teng = QPushButton('=')
        self.cler = QPushButton('C')


        self.btn_1.clicked.connect(lambda: self.press_num('1'))
        self.btn_2.clicked.connect(lambda: self.press_num('2'))
        self.btn_3.clicked.connect(lambda: self.press_num('3'))
        self.btn_4.clicked.connect(lambda: self.press_num('4'))
        self.btn_5.clicked.connect(lambda: self.press_num('5'))


        self.btn_6.clicked.connect(lambda: self.press_num('6'))
        self.btn_7.clicked.connect(lambda: self.press_num('7'))
        self.btn_8.clicked.connect(lambda: self.press_num('8'))
        self.btn_9.clicked.connect(lambda: self.press_num('9'))
        self.btn_0.clicked.connect(lambda: self.press_num('0'))

        self.btn_plus.clicked.connect(lambda: self.press_num('+'))
        self.btn_minus.clicked.connect(lambda: self.press_num('-'))
        self.btn_kop.clicked.connect(lambda: self.press_num('*'))
        self.btn_bol.clicked.connect(lambda: self.press_num('/'))
        self.btn_teng.clicked.connect(lambda: self.press_num('='))
        self.cler.clicked.connect(lambda: self.press_num('C'))



        self.h_bir.addWidget(self.btn_bol)
        self.h_bir.addWidget(self.btn_kop)
        self.h_bir.addWidget(self.btn_minus)
        self.h_bir.addWidget(self.btn_plus)
        self.h_bir.addWidget(self.btn_teng)
        self.h_bir.addWidget(self.cler)
        self.cler.clicked.connect(self.clear_display)

        
        self.h_iki.addWidget(self.btn_1)
        self.h_iki.addWidget(self.btn_2)
        self.h_iki.addWidget(self.btn_3)
        self.h_iki.addWidget(self.btn_4)
        self.h_iki.addWidget(self.btn_5)


        self.h_uch.addWidget(self.btn_6)
        self.h_uch.addWidget(self.btn_7)
        self.h_uch.addWidget(self.btn_8)
        self.h_uch.addWidget(self.btn_9)
        self.h_uch.addWidget(self.btn_0)


        self.v_main.addWidget(self.display)
        self.v_main.addLayout(self.h_bir)   
        self.v_main.addLayout(self.h_iki)
        self.v_main.addLayout(self.h_uch)


        self.setLayout(self.v_main)


    def press_num(self, n):
        current = self.display.text()
        if n == '=':
            try:
                result = str(eval(current))
                self.display.setText(result)
            except:
                self.display.setText("Error")
        else:
            self.display.setText(current + n)

    def clear_display(self):
        self.display.clear()









app = QApplication([])
win = Mywindow()
win.show()
app.exec_()