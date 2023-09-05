Create Table master_table as (
Select Distinct c.customerid,
				c.firstname,
				c.lastname,
				c.customeremail,
				c.customerphone,
				c.customeraddress,
				c.customercity,
				c.customerstate,
				c.customerzip,
				pc.categoryname,
				p.prodname,
				Min(o.date) as First_Of_Date,
				Sum(o.quantity) as Sum_Of_Quantity,
				Sum(p.price) as Sum_Of_Price
From (product_category pc Inner Join products p On pc.categoryID = p.category)
Inner Join (customers c Inner Join orders o On c.Customerid = o.customerid) On
p.ProdNumber = o.ProdNumber
Group By c.customerid,
		c.firstname, 
		c.lastname, 
		c.customeremail, 
		c.customerphone, 
		c.customeraddress, 
		c.customercity, 
		c.customerstate, 
		c.customerzip, 
		pc.categoryname, 
		p.prodname
)