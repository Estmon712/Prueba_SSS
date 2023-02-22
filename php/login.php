<?php 
    session_start();
    include_once "config.php";
    $mail = mysqli_real_escape_string($conn, $_POST['mail']);
    $pass = mysqli_real_escape_string($conn, $_POST['pass']);
    if(!empty($mail) && !empty($pass)){
        $sql = mysqli_query($conn, "SELECT * FROM usuarios WHERE mail = '{$mail}'");
        if(mysqli_num_rows($sql) > 0){
            $row = mysqli_fetch_assoc($sql);
            $user_pass = md5($pass);
            $enc_pass = $row['pass'];
            if($user_pass === $enc_pass){
                $status = "En línea";
                $sql2 = mysqli_query($conn, "UPDATE usuarios SET status = '{$status}' WHERE unique_id = {$row['unique_id']}");
                if($sql2){
                    $_SESSION['unique_id'] = $row['unique_id'];
                    echo "success";
                }else{
                    echo "Hubo un error, por favor intenta de nuevo.";
                }
            }else{
                echo "Correo o contraseña incorrecta.";
            }
        }else{
            echo "$mail - este correo no existe.";
        }
    }else{
        echo "Por favor completa todos los espacios.";
    }
?>