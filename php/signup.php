<?php
    session_start();
    include_once "config.php";
    $nombre = mysqli_real_escape_string($conn, $_POST['nombre']);
    $apellidos = mysqli_real_escape_string($conn, $_POST['apellidos']);
    $mail = mysqli_real_escape_string($conn, $_POST['mail']);
    $pass = mysqli_real_escape_string($conn, $_POST['pass']);
    if(!empty($nombre) && !empty($apellidos) && !empty($mail) && !empty($pass)){
        if(filter_var($mail, FILTER_VALIDATE_EMAIL)){
            $sql = mysqli_query($conn, "SELECT * FROM usuarios WHERE mail = '{$mail}'");
            if(mysqli_num_rows($sql) > 0){
                echo "$mail - This mail already exist!";
            }else{
                if(isset($_FILES['image'])){
                    $img_name = $_FILES['image']['name'];
                    $img_type = $_FILES['image']['type'];
                    $tmp_name = $_FILES['image']['tmp_name'];
                    
                    $img_explode = explode('.',$img_name);
                    $img_ext = end($img_explode);
    
                    $extensions = ["jpeg", "png", "jpg"];
                    if(in_array($img_ext, $extensions) === true){
                        $types = ["image/jpeg", "image/jpg", "image/png"];
                        if(in_array($img_type, $types) === true){
                            $time = time();
                            $new_img_name = $time.$img_name;
                            if(move_uploaded_file($tmp_name,"images/".$new_img_name)){
                                $ran_id = rand(time(), 100000000);
                                $status = "En línea";
                                $encrypt_pass = md5($pass);
                                $insert_query = mysqli_query($conn, "INSERT INTO usuarios (unique_id, nombre, apellidos, mail, pass, img, status)
                                VALUES ({$ran_id}, '{$nombre}','{$apellidos}', '{$mail}', '{$encrypt_pass}', '{$new_img_name}', '{$status}')");
                                if($insert_query){
                                    $select_sql2 = mysqli_query($conn, "SELECT * FROM usuarios WHERE mail = '{$mail}'");
                                    if(mysqli_num_rows($select_sql2) > 0){
                                        $result = mysqli_fetch_assoc($select_sql2);
                                        $_SESSION['unique_id'] = $result['unique_id'];
                                        echo "success";
                                    }else{
                                        echo "Esta dirección de correo no existe.";
                                    }
                                }else{
                                    echo "Hubo un error, por favor intenta de nuevo.";
                                }
                            }
                        }else{
                            echo "Por favor suba una imagen con los siguientes formatos: jpeg, png, jpg.";
                        }
                    }else{
                        echo "Por favor suba una imagen con los siguientes formatos: jpeg, png, jpg.";
                    }
                }
            }
        }else{
            echo "$mail no es un correo válido.";
        }
    }else{
        echo "Por favor completa todos los espacios.";
    }
?>