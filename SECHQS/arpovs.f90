program arpovs
  use modarpovs
  implicit none


if (mon_rang==0) call CPU_TIME( t2 )





call precalc
!!!!!!!!!!!!!!!!!!!!!!!!!!permeabilite intreseque!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
if(permeaperco)then
!call permintr
call ipbrut
end if


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!Invasion gradient macro!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!if(gradmac)then
!call gradientmac
!end if
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!algo visq pression impose ip!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!if(pimpovisq.and..not.gradmac)then
!call visqpimpo
!end if

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!Débit imposé!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!if(debitimpose.and..not.pimpovisq.and..not.gradmac)then
!call visqdebimpo
!end if


!!!!!!!!!!!!!!!!!!!!!!!!!!sechage!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

if(sechage)then
select case(invasions)
case("QS")
call sechbrut
case("CL")
call skelvin
case("VI")
call skelvinvisq
end select
end if

!if(sechage.and.s2d)then
!if(nk.eq.1)print*,"sechage 2d"
!call sechbrut2d
!end if
!ressortt=.true.

!if(ressortt)then
!print*,"resssssssssssssort"
!call systemun
!end if
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


!!!!!!!!!!!!!!!!!!!!!!!!!!solution de référence visqueux!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
if (mon_rang==0) then
!    write(*,1005)
!    write(*,1002)step
!  if(outsat)write(*,1018)Sat,Satfree
 ! if(piegeage)write(*,1017)totclust
  !if(outk)then
   !  write(*,1011)kinx/kx,koutx/kx
   !  write(*,1012)kiny/ky,kouty/ky
    ! write(*,1013)kinz/kz,koutz/kz
!  end if
!    write(*,1004)
!  call wrtbinstep
!  call wrtpltstep
!  call wrtvtpstep
  if(.not.muet)write(*,*)"Désallocation mémoire"
end if ! mon_rang==0
  call dealloc
if (mon_rang==0) write(*,*)"Happy End of Arpovs"
if (mon_rang==0) call CPU_TIME( t2 )
if (mon_rang==0) print *,"temps d'execution",t2 - t1
!open(unit=17,file="temps_new",position="append")
!	write(unit=17,fmt=1508)t2-t1,ni,nj,nk
!	close(unit=17)


!1503 format(6(e))
!1508 format(2e,3I)
!1001 format('  Echelon de pression n° : ',I4,/,'     Pression d''entrée : ',e11.4,' Sat: ',e11.4,' Satfree: ',e11.4)
!1101 format('  Echelon de pression n° : ',I4,/,' Sat: ',e11.4,' Satfree: ',e11.4)
!1002 format(/,'   Invasion n° : ',I6,' achevée')
!1003 format('R')
!1004 format('')
!1005 format('<')
!1006 format('T')
!1007 format('     >')
!1008 format('<',/,'          Percée suivant x: i=',I4,/,'  Pression d''entrée : ',e11.4,' Sat: ',e11.4,' Satfree: ',e11.4,/,'     >')
!1009 format('<',/,'          Percée suivant y: j=',I4,/,'  Pression d''entrée : ',e11.4,' Sat: ',e11.4,' Satfree: ',e11.4,/,'     >')
!1010 format('<',/,'          Percée suivant z: k=',I4,/,'  Pression d''entrée : ',e11.4,' Sat: ',e11.4,' Satfree: ',e11.4,/,'     >')
!1011 format("     kinx :",1x,E19.13,"  koutx :",1x,E19.13)
!1012 format("     kiny :",1x,E19.13,"  kouty :",1x,E19.13)
!1013 format("     kinz :",1x,E19.13,"  koutz :",1x,E19.13)
!1014 format("     kx   :",1x,E19.13)
!1015 format("     ky   :",1x,E19.13)
!1016 format("     kz   :",1x,E19.13)
!1017 format('     ',I5.5,' amas piégés')
!1018 format('     Saturation : ',e11.4,/,'     Saturation libre: ',e11.4)
end program arpovs

