# JSP_ShoppingWebsite
This project use JSP and MySQL to implement sex toys online shopping website with backstage and lots of website functions.

**Thanks for my teammate to finishing this project together!!!**

## Implement function list
* Log in/out
* Member System
  * Member information
  * Order lookup
  * Member level
  * Member distinguish discount
* Shopping cart
* Guestbook
* Random advertisement
* Visitor counter
* Backstage
  * Products management
  * Members management
  * Orders management
* Prevent SQL injection

## Set up environment
* JDK
* Notepad++
* Tomcat
* .NET Framework 4 or upper version
* MySQL
* mysql_connector_java.jar

## Website architecture
![](/readme/System.png)

## Database details
**advertisement**
Column Name|Type|Description
-----------|----|-----------
id|int(20)|Advertisement number
imagepath|varchar(50)|Image file path
link|text|Hyter link
alternate|text|Description text
adcontent|text|remarks

**counter**
Column Name|Type|Description
-----------|----|-----------
count|int(10)|Visitor quantity

**guestbook**
Column Name|Type|Description
-----------|----|-----------
no|tinyint(4)|Message number
name|varchar(10)|Message name
mail|varchar(10)|message email address
subject|varchar(30)|Message title
content|varchar(30)|Message content
putdate|date|Message date
IP|text|Message IP address

**login**
Column Name|Type|Description
-----------|----|-----------
account|varchar(50)|Account
password|varchar(50)|Password

**member**
Column Name|Type|Description
-----------|----|-----------
id|int(10)|Member number
name|varchar(20)|Member name
account|varchar(50)|Member account
password|varchar(50)|Member passowrd
phone|varchar(20)|Member cellphone number
address|varchar(50)|Member address
email|varchar(50)|Memer email address
level|varchar(10)|Member level
discount|varchar(10)|Discount for products according to member level

**product**
Column Name|Type|Description
-----------|----|-----------
id|int(10)|Product number
name|varchar(100)|Product name
type|varchar(10)|Product type
introduce01|varchar(500)|Product description
introduce02|varchar(500)|Product introduction
price|int(10)|Product price
quantity|int(10)|Stock number of product
imagepath|varchar(100)|Product image file path

**temptrade**  
This data sheet is shopping cart.
Column Name|Type|Description
-----------|----|-----------
id|int(10)|Shopping cart number
productName|varchar(100)|Product name
productID|int(10)|Product number|
productType|varchar(10)|Product type
productPrice|int(10)|Product price
productQuantity|int(10)|Stock number of product
memberAccount|varchar(50)|Member account who buy this product

**trademember**  
This data sheet is the order about the information of buyer.
Column Name|Type|Description
-----------|----|-----------
id|int(11)|Order number
memberName|varchar(20)|Buyer name
memberAccount|varchar(50)|Buyer account
tradeWay|varchar(50)|The way of shipping the product
memberPhone|varchar(20)|Buyer cellphone number
memberAddress|varchar(50)|Delivery address
memberLevel|varchar(50)|Buyer level

**tradeproduct**  
This data sheet is the order about the information product.
Column Name|Type|Description
-----------|----|-----------
id|int(10)|number
productName|varchar(100)|Product name
productID|int(10)|Product ID
productType|varchar(10)|Product type
productPrice|int(10)|Product price
productQuantity|int(10)|Stock number of product
total|int(30)|Price payable after discount
memberAccount|varchar(50)|Buyer account

## Website instructions
**Back to homepage**  
Click the toppest image  

**Search**  
Input keyword into search bar and click "♡按我查詢商品♡".
* Search successfully  
  The result page will list prdouct name, product type, product price and stock quantity.  
  Click "點我查看" to check detail information.
* Search failed
  The result page will show "查無此資料".  

**Registration**  
Click "沒有會員嗎？" from left menu.  
Click "按我註冊" after you filling out the form.  

**Buy product**  
Log in.  
Click "產品種類".  
Click "按我購買".  
Click "按我放入購物車".  

**Edit member's information**  
Log in.  
Click "會員區".  
Click "我的資料".  
Click "按我修改".  
Click "按我修改" after you editing.  

**Lookup the shopping cart**  
Log in.  
Click "會員區".  
Click "我的購物車".  
Click "查看購物車".  

**Edit the list in the shopping cart**  
Log in.  
Click "會員區".  
Click "我的購物車".  
Click "查看購物車".  
Click "修改".  
Click "按我修改" after you editing.  

**Cancel the list in the shopping cart**  
Log in.  
Click "會員區".  
Click "我的購物車".  
Click "查看購物車".  
Click "修改".  
Click "取消".  
Click "確定要刪除？".  

**Checkout**  
Log in.  
Click "會員區".  
Click "我的購物車".  
Click "我要結帳了".  
Keep clicking "來去下一頁".  

**Lookup order**  
Log in.  
Click "會員區".  
Click "我的訂單".  

**Write messange**
Click "留言版".  
Click "按我送出" after you filling out the form.  

**View messange**
Click "留言版".  
Click "按我看廢文".
