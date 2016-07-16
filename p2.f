        PROGRAM helloWorld
	      REAL transactions(100, 4)
        CHARACTER  name*15, address*25, city*15, province*10, balance*7
        CHARACTER invoicefilename*20
        CHARACTER output
        REAL customer
        CHARACTER ccustomer*5, tcustomer*5,titem*6,tquantity*1
        CHARACTER tcode*1
        INTEGER tlines, reason,clines
        INTEGER cios, tios
        CHARACTER t4
        CHARACTER error*50
        tlines=0
*open the transactions file
	      OPEN(unit=3, file="customers.dat")
        DO
          READ(3,*, IOSTAT=cios) ccustomer, name, address, city, province, balance
          print *, name

          invoicefilename = "invoices/"//ccustomer//".dat"
          OPEN(unit=1, FILE=invoicefilename,STATUS='NEW')
          WRITE(1, '(A)') name//address//city//province
          CLOSE(1)

          tlines = tlines+1
        END DO
*iterate over it and add all the values to the array
        PRINT *, 'Hello, world!'
        PRINT *, tlines
      END
