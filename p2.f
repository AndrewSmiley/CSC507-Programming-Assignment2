        PROGRAM helloWorld
        CHARACTER  cc*5,name*15, address*25, city*15, province*10
        REAL balance
        CHARACTER invoicefilename*20, data*150
        INTEGER tlines, cios,tios
	      OPEN(unit=3, file="customers.dat")
        cios = 0
        tios=0
        tlines = 1
        DO
          READ(3,*, IOSTAT=cios) cc, name, address, city,province, balance
          print *, name
          IF (cios > 0) THEN
            PRINT *, cios
            EXIT
          ELSE IF (cios < 0) THEN
            PRINT *, "EOF REACHED"
            STOP

          ELSE
            invoicefilename = "invoices/"//cc//".dat"
            OPEN(unit=1, FILE=invoicefilename,STATUS='OLD')
            data= name//" "//address//" "//city//","//province
            WRITE(1, '(A)') name, address, city//" "//province
            CLOSE(1)
          END IF
        END DO

      END
