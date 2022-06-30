#!/bin/bash

asis_onethousandwon=5
asis_fivehundredwon=10
asis_onehundredwon=10
asis_fiftywon=10
asis_tenwon=30

change()
{
	if [ $asis_onethousandwon -le 0 ]; then
		echo "거스름돈 천원의 개수가 부족하니 관리자에게 문의해주세요"
		exit 1
	elif [ $asis_onethousandwon -gt 0 ]; then
		let onethousandwon=$changemoney/1000
		let asis_onethousandwon=asis_onethousandwon-onethousandwon
	fi	

	if [ $asis_fivehundredwon -le 0 ]; then
		echo "거스름돈 오백원의 개수가 부족하니 관리자에게 문의해주세요"
		exit 1
	elif [ $asis_fivehundredwon -gt 0 ]; then
		let fivehundredwon=$changemoney%1000/500
		let asis_fivehundredwon=asis_fivehundredwon-fivehundredwon		
	fi	

	if [ $asis_onehundredwon -le 0 ]; then
		echo "거스름돈 백원의 개수가 부족하니 관리자에게 문의해주세요"
		exit 1
	elif [ $asis_onehundredwon -gt 0 ]; then
		let onehundredwon=$changemoney%1000%500/100
		let asis_onehundredwon=asis_onehundredwon-onehundredwon
	fi	

	if [ $asis_fiftywon -le 0 ]; then
		echo "거스름돈 오십원의 개수가 부족하니 관리자에게 문의해주세요"
		exit 1
	elif [ $asis_fiftywon -gt 0 ]; then
		let fiftywon=$changemoney%1000%500%100/50
		let asis_fiftywon=asis_fiftywon-fiftywon
	fi
	
	if [ $asis_tenwon -le 0 ]; then
		echo "거스름돈 십원의 개수가 부족하니 관리자에게 문의해주세요"
		exit 1
	elif [ $asis_tenwon -gt 0 ]; then
		let tenwon=$changemoney%1000%500%100%50/10
		let asis_tenwon=asis_tenwon-tenwon
	fi

	
#	if [ $asis_onethousandwon -le 0 ]; then
#		echo "거스름돈 천원의 개수가 부족하니 관리자에게 문의해주세요"
#	elif [ $asis_fivehundredwon -le 0 ]; then
#		echo "거스름돈 오백원의 개수가 부족하니 관리자에게 문의해주세요"
#	elif [ $asis_onehundredwon -le 0 ]; then
#		echo "거스름돈 백원의 개수가 부족하니 관리자에게 문의해주세요"
#	elif [ $asis_fiftywon -le 0 ]; then
#		echo "거스름돈 오십원의 개수가 부족하니 관리자에게 문의해주세요"
#	elif [ $asis_tenwon -le 0 ]; then
#		echo "거스름돈 십원의 개수가 부족하니 관리자에게 문의해주세요"		
#	fi		
	
	echo ""
	echo "자판기 거스름 돈 갯수 :"
	echo "천원 : $asis_onethousandwon"
	echo "오백원 : $asis_fivehundredwon"
	echo "백원 : $asis_onehundredwon"
	echo "오십원 : $asis_fiftywon"
	echo "십원 : $asis_tenwon"
	echo ""	
	
}

calc()
{
	coke=850
	sprite=800
	hwanta=750
	water=500
	
	while :
	do
		case $menu in
		  1)
			if [ $money -ge $coke ]; then
				echo ""
				echo "콜라 구매가 완료되었습니다."
				let changemoney=money-coke
				echo "잔돈 : $changemoney 원"
				
				change
			elif [ $money -lt $coke ]; then
				echo ""
				echo "금액이 부족합니다."
			fi
			main
			;;
		  2)
			if [ $money -ge $sprite ]; then
				echo ""
				echo "사이다 구매가 완료되었습니다."
				let changemoney=money-sprite
				echo "잔돈 : $changemoney 원"
				
				change
			elif [ $money -lt $sprite ]; then
				echo ""
				echo "금액이 부족합니다."
			fi
			main
			;;
		  3)
			if [ $money -ge $hwanta ]; then
				echo ""
				echo "환타 구매가 완료되었습니다."
				let changemoney=money-hwanta
				echo "잔돈 : $changemoney 원"
				
				change
			elif [ $money -lt $hwanta ]; then
				echo ""
				echo "금액이 부족합니다."
			fi
			main
			;;
		  4)
			if [ $money -ge $water ]; then
				echo ""
				echo "생수 구매가 완료되었습니다."
				let changemoney=money-water
				echo "잔돈 : $changemoney 원"
				
				change
			elif [ $money -lt $water ]; then
				echo ""
				echo "금액이 부족합니다."
			fi
			main
			;;
		  *)
			echo ""
			echo "없는 메뉴입니다. 아래 메뉴에서 다시 선택해 주십시오." 
			main
			;;
		esac
	  
	done

}

## ---------------------------------------------------------------------------------------------- ##
#  main
## ---------------------------------------------------------------------------------------------- ##
main()
{
	echo "1.콜라 850원, 2.사이다 800원, 3.환타 750원, 4.생수 500원"
	
	read -p "금액을 입력하세요 : " money
	
	read -p "메뉴를 선택하세요 : " menu
	
	calc
    

exit 0
}

main $@
