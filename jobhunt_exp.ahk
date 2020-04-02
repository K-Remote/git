#InstallKeybdHook 
#UseHook

;; 制御関連

sc07B:: Send, {sc07B}						;無変換単独はそのまま素通し

#Hotstring *

;;　名前　tab区切り　2回入力
sc07B & n::
    Clipboard = 苗字
    Send,^v  
    Sleep, 50	
    Send,{tab}  
    Clipboard = 名前
    Send,^v  
    Sleep, 50	
    Send,{tab}  
    Clipboard = みょうじ
	Send,^v    
    Sleep, 50	
    Send,{tab}  
	Clipboard = なまえ
	Send,^v    
    Send,{tab}  
return

;;　郵便番号　tab区切り
sc07B & z::
    Clipboard = 郵便番号上3桁
    Send,^v  
    Send,{tab}  
    Clipboard = 郵便番号下4桁
    Send,^v  
return

;;　番地　単純入力
sc07B & b::
    Clipboard = 住所番地以降
    Send,^v  
return

;;　メール　1回入力
sc07B & @::
    Sleep, 50       
    Clipboard = sample@myuniv.ac.jp
    Sleep, 50       
    Send,^v  
return

;;　メール　2回入力
sc07B & w::
    Sleep, 50       
    Clipboard = sample@myuniv.ac.jp
    Sleep, 50       
    Send,^v  
    Sleep, 50       
    Send,{tab}  
    Sleep, 50       
    Send,^v  
return

;; メアド　タブ区切りで2回入力
sc07B & t::
    Clipboard = usename
    Send,^v  
    Sleep, 50       
    Send,{tab}  
    Clipboard = domain
    Send,^v  
    Sleep, 50       
    Send,{tab}  
    Clipboard = username
    Send,^v  
    Sleep, 50       
    Send,{tab}  
    Clipboard = domain
    Send,^v  
return

;; high school
sc07B & h::
    Sleep, 50      
    Clipboard = 甲立某高等学校
    Sleep, 50
    Send,^v  
return

;; University
sc07B & u::
    Sleep, 50      
    Clipboard = 乙大学
    Sleep, 50
    Send,^v  
return

;; Faculty
sc07B & f::
    Sleep, 50      
    Clipboard = 学部
    Sleep, 50
    Send,^v  
return

;; Department
sc07B & d::
    Sleep, 50      
    Clipboard = 学科
    Sleep, 50
    Send,^v  
return

;; Course
sc07B & c::
    Sleep, 50      
    Clipboard = コース
    Sleep, 50
    Send,^v  
return

;; Labo
sc07B & l::
    Sleep, 50      
    Clipboard = 丙研究室
    Sleep, 50
    Send,^v  
return

;; Graduate school
sc07B & g::
    Sleep, 50      
    Clipboard = 丁大学院
    Sleep, 50
    Send,^v  
return

;; Specialization
sc07B & j::
    Sleep, 50      
    Clipboard = 専攻
    Sleep, 50
    Send,^v  
return

;; Specialization
sc07B & s::
    Sleep, 50      
    Clipboard = コース
    Sleep, 50
    Send,^v  
return

;; Professor
sc07B & p::
    Sleep, 50      
    Clipboard = 指導教員名
    Sleep, 50
    Send,^v  
return

;; Mobilephone
sc07B & m::
    Clipboard = 電話番号１
    Sleep, 50       
    Send,^v  
    Sleep, 50       
    Send,{tab}  
    Sleep, 50       
    Clipboard = 電話番号２
    Sleep, 50       
    Send,^v  
    Sleep, 50       
    Send,{tab}  
    Sleep, 50       
    Clipboard = 電話番号３
    Sleep, 50       
    Send,^v  
return





;;アクティブウインドウ切り替えのショートカット
#WinActivateForce


sc079 & c::
  SetTitleMatchMode,2
  WinActivate, Google Chrome
return

sc079 &  w::
  SetTitleMatchMode,2
  WinActivate, Word
return

sc079 & p::
  SetTitleMatchMode,2
  WinActivate, PowerPoint
return

sc079 & e::
  SetTitleMatchMode,2
  WinActivate, Excel
return

sc079 & m::
  SetTitleMatchMode,2
  WinActivate, メール
return