        PROGRAM helloWorld
        CHARACTER  cc*5,name*15, address*25, city*15, province*10
        CHARACTER tcustomer*5, tprod*6, tquantity*1, tcode*1
        CHARACTER inumber*6, idescription*20, istocked*2, itostock*2
        REAL balance, icost
        CHARACTER invoicefilename*20, data*150
        INTEGER tlines, cios,tios
	      OPEN(unit=3, file="customers.dat")
        cios = 0
        tios=0
        tlines = 1
        DO WHILE(cios.eq.0)
          READ(3,*, IOSTAT=cios) cc, name, address, city,province, balance
*          print *, name
          IF (cios > 0) THEN
            PRINT *, cios
            EXIT
          ELSE IF (cios < 0) THEN
            PRINT *, "EOF REACHED"
            STOP

          ELSE
            tios=0
*            PRINT *, "reading another line"
            invoicefilename = "invoices/"//cc//".dat"
            OPEN(unit=1, FILE=invoicefilename,STATUS='OLD')
            data= name//" "//address//" "//city//","//province
            WRITE(1, '(A)') name, address, city//" "//province
*ok so this should work
            OPEN(unit=4, file="transactions.dat")
            DO WHILE(tios.eq.0)
              READ(4, *, IOSTAT=tios) tcustomer, tprod, tquantity, tcode
              IF (tios > 0) THEN
                PRINT *, tios
                PRINT *, "AN ERROR OCCURED WITH TRANSACITONS FILE"
                STOP
              ELSE IF(tios<0) THEN
                PRINT *, "EOF Reached in transactions"

              ELSE
                PRINT *, "Comparing "//tcustomer//" and "//cc
                IF(tcustomer.eq.cc) THEN
* ok so if we have a match lets go ahead and
*look up the product information

*                  print *, "write another line"
                  WRITE(1, '(A)') tprod//" "//tquantity
                END IF
              END IF

            END DO
            CLOSE(4)
            CLOSE(1)
          END IF
        END DO

      END
