<!-- Connection to database -->
<?php
$connection = mysqli_connect(/*where*/"localhost", /*name*/"root", /*password*/"", "AwesomeAirport");

if($connection){
    echo "Připojení proběhlo úspěšně.";
} else {
     die("Ups, něco se pokazilo...");
}

$query = "SELECT * FROM airport";

$result = mysqli_query($connection, $query);

if(!$result) {
    die("Ups, dotaz do databáze selhal" .mysqli_error());
}

?>

<!-- Write data of databse -->
<!DOCTYPE html>
<html lang="cs">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AwesomeAirtport</title>
</head>
<body>
    <p>
    <?php   
        while($row = mysqli_fetch_row($result)) {
            print_r($row);
        }
        while($row)
    ?>
</body>
</html>