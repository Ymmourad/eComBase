<?php
$host = "localhost";
$dbusername = "root";
$dbpassword = "password";
$dbname= "eComBase";
$conn = new mysqli ($host, $dbusername, $dbpassword, $dbname);

$sql="SELECT *FROM PRODUCT, PRODUCT_DETAIL_INFORMATION;";



if ($conn->query ($sql)){
    $result = $conn -> query($sql);

   while($row = mysqli_fetch_assoc($result) ){
        echo "
              Name: {$row['Name']} <br>
              Type: {$row['Type']} <br>
              Product SKU: {$row['Product_SKU']} <br>
              Market Price: {$row['Market_Price']} <br>
              Retail Price: {$row['Retail_Price']} <br>
              Height: {$row['Height']} <br>
              Weight: {$row['Weight']} <br>
              Width: {$row['Width']} <br>
              Periodic Restock: {$row['Periodic_Restock']} <br>
              Random Restock: {$row['Random_Restock']} <br>
              Refurbished: {$row['Refurbised']} <br>
              Rarity: {$row['RarityScaricityAvailability']} <br>

        
        <br>";
    }


}else{
    echo "Error:" .sql ."<br>". $conn->error;
}
$conn->close();

?>