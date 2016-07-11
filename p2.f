      PROGRAM helloWorld
	      REAL transactions(100, 4)
        CHARACTER  name*20, address*20, city*15, province*15, balance*15
        CHARACTER invoicefilename*20
        CHARACTER output
        REAL customer
        CHARACTER ccustomer*5, tcustomer*5,titem*6,tquantity*1, tcode*1
        INTEGER tlines, reason,clines
        INTEGER ios
        CHARACTER t4
        tlines=0
*open the transactions file
	      OPEN(unit=2, file="customers.dat")
        DO
          READ(2,*, IOSTAT=ios) ccustomer, name, address, city, province
          print *, name
          invoicefilename = "invoices/"//ccustomer//".dat"
          OPEN(unit=1, FILE=invoicefilename,STATUS='OLD')
          output = name//' '//address//' '//city//' '//province
*          print *, output
          WRITE(1, '(A)') name//address//city//province
*          WRITE(1, '(/)') address
          CLOSE(1)
          IF (ios > 0) THEN
            EXIT
          ELSE IF (ios < 0) THEN
            PRINT *, 'EOF REACHED'
            EXIT
          ELSE

          END IF
          tlines = tlines+1
        END DO
*iterate over it and add all the values to the array
        PRINT *, 'Hello, world!'
        PRINT *, tlines
      END
