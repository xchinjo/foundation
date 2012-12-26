========================================================
Installation
========================================================
สิ่งที่ต้องติดตั้ง
-  ERP System
- IIS

การเซต IIS
 - Windows XP(SP2/SP1)
 - เปิด    Control Panel>Administrative Tools>Internet Information Servicess
 - Web Sites > Default Web Site
 - คลิก ขวา ตรง Default Web Site เลือก New > Virtual Directory
	- ตั้งAliase  (เช่น ERP เวลาเรียก web ก็จะเป็น http://localhost/erp หรือ http://192.168.0.1/erp )
	หลักจากนั้น Next 
	- Web Site content Derectory
	    Browse ไป ที่ ตำแหน่งที่ install ERP System (เช่น C:\Program Files\OpenSoft\ERP System)
	- Access Permissions
	    Read ,Run Script,Execute

	- finish

ตั้งค่า Documents index คลิก ขวา ที่ ERP เลือก Properties>Documents
  -  ลบ รายชื่อไฟล์เดิม ออก
  -  คลิก add 
  - กรอก gl.dll 
  - ok 
=============================================================






