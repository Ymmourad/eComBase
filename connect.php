<?php
   $NameofProduct = filter_input(INPUT_POST, 'NameofProduct');
   $Type = filter_input(INPUT_POST, 'Type');
   $SKU = filter_input(INPUT_POST, 'SKU');
   $MarketPrice = filter_input(INPUT_POST, 'MarketPrice');
   $RetailPrice = filter_input(INPUT_POST, 'RetailPrice');
   $Height = filter_input(INPUT_POST, 'Height');
   $Weight = filter_input(INPUT_POST, 'Weight');
   $Width = filter_input(INPUT_POST, 'Width');
   $Rarity = filter_input(INPUT_POST, 'Rarity');
   $boolean1 = filter_input(INPUT_POST, 'PeriodicRestock');
   $boolean2 = filter_input(INPUT_POST, 'RandomRestock');
   $boolean3 = filter_input(INPUT_POST, 'Refurbished');
   if(!empty($NameofProduct) ||
            !empty($Type)
            || !empty($SKU)
            || !empty($MarketPrice)
            || !empty($RetailPrice)
            || !empty($Height)
            || !empty($Weight)
            || !empty($Width)
            || !empty($Rarity)
            || !empty($boolean1)
            || !empty($boolean2)
            || !empty($boolean3)
            ) {
                        $host = "localhost";
                        $dbusername = "root";
                        $dbpassword = "password";
                        $dbname= "eComBase";
                        $count = -1;

                        //Creating Connection
                        $conn = new mysqli ($host, $dbusername, $dbpassword, $dbname);
                        if(mysqli_connect_error()){
                        die('Connect Error ('. mysqli_connect_errno() .') '
                            .mysqli_connect_error());
                        }else{
                            $sql3 = "SELECT count(*) as total from product_detail_information";
                            $result = $conn->query($sql3);
                            while($row = $result->fetch_assoc()) {
                               $count = $row["total"] + 1 ;
                            }

                            $sql = "INSERT INTO PRODUCT(Name, Type)
                                    Values('$NameofProduct','$Type')";

                            $sql2 = "INSERT INTO PRODUCT_DETAIL_INFORMATION(Product_SKU, Market_Price, Retail_Price, Height, Weight, Width,
                                      Periodic_Restock,Random_Restock,Refurbised,RarityScaricityAvailability,MANUFACTURES_Id,INDUSTRY_Id,PRODUCT_Id )
                                    Values('$SKU','$MarketPrice','$RetailPrice', '$Height','$Weight','$Width'
                                           ,'$boolean1','$boolean2','$boolean3','$Rarity',1,1,1)";



                        if ($conn->query ($sql) && $conn->query($sql2) && $conn->query($sql3)){
                            echo "New record is inserted successfully";

                            }else{
                                echo "Error:" .sql ."<br>". $conn->error;
                            }
                            $conn->close();
                        }

    }else{
    echo "Please fill in all of the fields";
    die();
    }
?>