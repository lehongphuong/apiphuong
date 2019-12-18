<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header('Access-Control-Allow-Headers: Origin, Content-Type, Authorization, X-Auth-Token');
header('Access-Control-Allow-Methods: GET, POST, PUT, PATCH, DELETE, HEAD, OPTIONS');
header('Content-Type: text/html; charset=utf-8');
include "db.php";
// $data = json_decode(file_get_contents("php://input"));
// include "db.php";
// $sql = "";
// $data = json_decode(base64_decode($data->ashdfkjashdfkjashdfkjashdfkjashdfkjashdf));  
$param = file_get_contents("php://input");

// decode param data
for($i = 0; $i < 3; $i++){
    // $param = base64_decode($param); 
} 

// decode param data 

$data = json_decode($param);
$sql = "";

if (isset($data->what)) { 

    switch ($data->what) {
        
        // excute string query
        case 0: {
            $sql = $data->sql;
            break;
        }

        // -10 thông tin của khách hàng đi xe
        // user(id, username, email, phone, address, level) 

        // -20 loại xe
        // car(id, name, image) 

        // -30 thông tin của tài xế đi xe
        // driver(id, idCompany, username, fullname, password, cmnd, phone, address, experience, image)

        // -40 thông tin chuyến đi của tài xế
        // trip(id, idDriver, type[xe đi ké hay xe quay đầu],fromLocation, destLocation,fromCenter,destCenter, startDate, endDate, startTime, endTime, price, numberSeat)

        // -50 các quy định đi xe như có nhạc, có hút thuốc hay không, có điều hòa hay không
        // regulation(id, idTrip, name)

        // -60 thông tin vé xe
        // ticket(id, idUser, idTrip, startDate, endDate, status[đã dùng hay chưa, hoăc hủy], type[vé thanh toán rồi, vé online thanh toán sau], price,) 

        // -70 đánh giá của khách hàng với tài xế trong chuyến đi nào đó
        // comment(id, idTrip, idDriver, idUser, star(1->5), message, feedback)

        // -80 Khuyến mãi với các chuyến đi khi thanh toán thì sẽ giảm giá
        // reward(id, percent, maxPrice(áp dụng với chuyến đi tối đa bao nhiêu tiền), startDate, endDate, status(đã dùng hay chưa))

        // -90 Thông tin công ty vận tải muốn tham gia
        // company(id, name, phone, address, startDate, endDate, status(còn hoạt động hay không))     

        // 100 - common 
        // history(id, idCompany, modDate, userId, sqlQuery, action) => sẻ được implement trong lúc call api   

        //******************user************************
        // user(id,username,email,phone,address,level)
        // Get all data from user
        case 10: {
            $sql = "SELECT * FROM user";
            break;
        }

        // Insert data to user
        case 11: {
            $sql = "INSERT INTO user(username,email,phone,address,level)
            		VALUES('$data->username','$data->email','$data->phone','$data->address','$data->level')";
            break;
        }

        // Update data user
        case 12: {
            $sql = "UPDATE user SET username='$data->username', email='$data->email', phone='$data->phone', address='$data->address', level = '$data->level'
            		WHERE id='$data->id'";
            break;
        }

        // Delete data of user
        case 13: {
            $sql = "DELETE FROM user
            		WHERE id='$data->id'";
            break;
        }

        // Find data with id user
        case 14: {
            $sql = "SELECT * FROM user
            		WHERE id='$data->id'";
            break;
        }


        //******************car************************
        // car(id,name,image)
        // Get all data from car
        case 20: {
            $sql = "SELECT * FROM car";
            break;
        }

        // Insert data to car
        case 21: {
            $sql = "INSERT INTO car(name,image)
            		VALUES('$data->name','$data->image')";
            break;
        }

        // Update data car
        case 22: {
            $sql = "UPDATE car SET name='$data->name', image = '$data->image'
            		WHERE id='$data->id'";
            break;
        }

        // Delete data of car
        case 23: {
            $sql = "DELETE FROM car
            		WHERE id='$data->id'";
            break;
        }

        // Find data with id car
        case 24: {
            $sql = "SELECT * FROM car
            		WHERE id='$data->id'";
            break;
        }


        //******************driver************************
        // driver(id,idCompany,username,password,cmnd,phone,address,experience,image)
        // Get all data from driver
        case 30: {
            $sql = "SELECT * FROM driver";
            break;
        }

        // Insert data to driver
        case 31: {
            $sql = "INSERT INTO driver(idCompany,username,password,cmnd,phone,address,experience,image)
            		VALUES('$data->idCompany','$data->username','$data->password','$data->cmnd','$data->phone','$data->address','$data->experience','$data->image')";
            break;
        }

        // Update data driver
        case 32: {
            $sql = "UPDATE driver SET idCompany='$data->idCompany', username='$data->username', password='$data->password', cmnd='$data->cmnd', phone='$data->phone', address='$data->address', experience='$data->experience', image = '$data->image'
            		WHERE id='$data->id'";
            break;
        }

        // Delete data of driver
        case 33: {
            $sql = "DELETE FROM driver
            		WHERE id='$data->id'";
            break;
        }

        // Find data with id driver
        case 34: {
            $sql = "SELECT * FROM driver
            		WHERE id='$data->id'";
            break;
        }


        //******************trip************************
        // trip(id,idDriver,type,fromLocation,destLocation,fromCenter,destCenter,startDate,endDate,startTime,endTime,price,numberSeat)
        // Get all data from trip
        case 40: {
            $sql = "SELECT * FROM trip";
            break;
        }

        // Insert data to trip
        case 41: {
            $sql = "INSERT INTO trip(idDriver,type,fromLocation,destLocation,fromCenter,destCenter,startDate,endDate,startTime,endTime,price,numberSeat)
            		VALUES('$data->idDriver','$data->type','$data->fromLocation','$data->destLocation','$data->fromCenter','$data->destCenter','$data->startDate','$data->endDate','$data->startTime','$data->endTime','$data->price','$data->numberSeat')";
            break;
        }

        // Update data trip
        case 42: {
            $sql = "UPDATE trip SET idDriver='$data->idDriver', type='$data->type', fromLocation='$data->fromLocation', destLocation='$data->destLocation', fromCenter='$data->fromCenter', destCenter='$data->destCenter', startDate='$data->startDate', endDate='$data->endDate', startTime='$data->startTime', endTime='$data->endTime', price='$data->price', numberSeat = '$data->numberSeat'
            		WHERE id='$data->id'";
            break;
        }

        // Delete data of trip
        case 43: {
            $sql = "DELETE FROM trip
            		WHERE id='$data->id'";
            break;
        }

        // Find data with id trip
        case 44: {
            $sql = "SELECT * FROM trip
            		WHERE id='$data->id'";
            break;
        }

        // get chuyến xe với điều kiện search
        case 45: { 
            $sql = "SELECT trip.*, d.username, d.fullname, d.cmnd, d.phone, d.address, d.experience, d.image FROM trip
                    LEFT JOIN driver d on trip.idDriver = d.id
                    WHERE DATEDIFF(endDate, '$data->startDate')>0
                    AND fromLocation = '$data->fromLocation'
                    AND destLocation = '$data->destLocation'";  
            break;
        }




        //******************regulation************************
        // regulation(id,idTrip,name)
        // Get all data from regulation
        case 50: {
            $sql = "SELECT * FROM regulation";
            break;
        }

        // Insert data to regulation
        case 51: {
            $sql = "INSERT INTO regulation(idTrip,name)
            		VALUES('$data->idTrip','$data->name')";
            break;
        }

        // Update data regulation
        case 52: {
            $sql = "UPDATE regulation SET idTrip='$data->idTrip', name = '$data->name'
            		WHERE id='$data->id'";
            break;
        }

        // Delete data of regulation
        case 53: {
            $sql = "DELETE FROM regulation
            		WHERE id='$data->id'";
            break;
        }

        // Find data with id regulation
        case 54: {
            $sql = "SELECT * FROM regulation
            		WHERE id='$data->id'";
            break;
        }


        //******************ticket************************
        // ticket(id,idUser,idTrip,startDate,endDate,status,type,price)
        // Get all data from ticket
        case 60: {
            $sql = "SELECT * FROM ticket";
            break;
        }

        // Insert data to ticket
        case 61: {
            $sql = "INSERT INTO ticket(idUser,idTrip,startDate,endDate,status,type,price)
            		VALUES('$data->idUser','$data->idTrip','$data->startDate','$data->endDate','$data->status','$data->type','$data->price')";
            break;
        }

        // Update data ticket
        case 62: {
            $sql = "UPDATE ticket SET idUser='$data->idUser', idTrip='$data->idTrip', startDate='$data->startDate', endDate='$data->endDate', status='$data->status', type='$data->type', price = '$data->price'
            		WHERE id='$data->id'";
            break;
        }

        // Delete data of ticket
        case 63: {
            $sql = "DELETE FROM ticket
            		WHERE id='$data->id'";
            break;
        }

        // Find data with id ticket
        case 64: {
            $sql = "SELECT * FROM ticket
            		WHERE id='$data->id'";
            break;
        }


        //******************comment************************
        // comment(id,idTrip,idDriver,star,message,feedback)
        // Get all data from comment
        case 70: {
            $sql = "SELECT * FROM comment";
            break;
        }

        // Insert data to comment
        case 71: {
            $sql = "INSERT INTO comment(idTrip,idDriver,star,message,feedback)
            		VALUES('$data->idTrip','$data->idDriver','$data->star','$data->message','$data->feedback')";
            break;
        }

        // Update data comment
        case 72: {
            $sql = "UPDATE comment SET idTrip='$data->idTrip', idDriver='$data->idDriver', star='$data->star', message='$data->message', feedback = '$data->feedback'
            		WHERE id='$data->id'";
            break;
        }

        // Delete data of comment
        case 73: {
            $sql = "DELETE FROM comment
            		WHERE id='$data->id'";
            break;
        }

        // Find data with id comment
        case 74: {
            $sql = "SELECT * FROM comment
            		WHERE id='$data->id'";
            break;
        }


        //******************reward************************
        // reward(id,percent,maxPrice,startDate,endDate,status)
        // Get all data from reward
        case 80: {
            $sql = "SELECT * FROM reward";
            break;
        }

        // Insert data to reward
        case 81: {
            $sql = "INSERT INTO reward(percent,maxPrice,startDate,endDate,status)
            		VALUES('$data->percent','$data->maxPrice','$data->startDate','$data->endDate','$data->status')";
            break;
        }

        // Update data reward
        case 82: {
            $sql = "UPDATE reward SET percent='$data->percent', maxPrice='$data->maxPrice', startDate='$data->startDate', endDate='$data->endDate', status = '$data->status'
            		WHERE id='$data->id'";
            break;
        }

        // Delete data of reward
        case 83: {
            $sql = "DELETE FROM reward
            		WHERE id='$data->id'";
            break;
        }

        // Find data with id reward
        case 84: {
            $sql = "SELECT * FROM reward
            		WHERE id='$data->id'";
            break;
        }


        //******************company************************
        // company(id,name,phone,address,startDate,endDate,status)
        // Get all data from company
        case 90: {
            $sql = "SELECT * FROM company";
            break;
        }

        // Insert data to company
        case 91: {
            $sql = "INSERT INTO company(name,phone,address,startDate,endDate,status)
            		VALUES('$data->name','$data->phone','$data->address','$data->startDate','$data->endDate','$data->status')";
            break;
        }

        // Update data company
        case 92: {
            $sql = "UPDATE company SET name='$data->name', phone='$data->phone', address='$data->address', startDate='$data->startDate', endDate='$data->endDate', status = '$data->status'
            		WHERE id='$data->id'";
            break;
        }

        // Delete data of company
        case 93: {
            $sql = "DELETE FROM company
            		WHERE id='$data->id'";
            break;
        }

        // Find data with id company
        case 94: {
            $sql = "SELECT * FROM company
            		WHERE id='$data->id'";
            break;
        }


        //******************history************************
        // history(id,idCompany,modDate,userId,sqlQuery,action)
        // Get all data from history
        case 100: {
            $sql = "SELECT * FROM history";
            break;
        }

        // Insert data to history
        case 101: {
            $sql = "INSERT INTO history(idCompany,modDate,userId,sqlQuery,action)
            		VALUES('$data->idCompany','$data->modDate','$data->userId','$data->sqlQuery','$data->action')";
            break;
        }

        // Update data history
        case 102: {
            $sql = "UPDATE history SET idCompany='$data->idCompany', modDate='$data->modDate', userId='$data->userId', sqlQuery='$data->sqlQuery', action = '$data->action'
            		WHERE id='$data->id'";
            break;
        }

        // Delete data of history
        case 103: {
            $sql = "DELETE FROM history
            		WHERE id='$data->id'";
            break;
        }

        // Find data with id history
        case 104: {
            $sql = "SELECT * FROM history
            		WHERE id='$data->id'";
            break;
        }
        
    }
    
    // echo $sql."<br>";
    
    //excute sql 
    $result = $conn->query($sql);
    
    // echo json_encode($result);
    if (isset($result->num_rows) && ($result->num_rows > 0)) {
        // output data of each row
        // echo "for";
        $data = array();
        while ($row = $result->fetch_assoc()) {
            $data[] = $row;
        }

        echo json_encode($data);
    } else {
        // echo json_encode($result);
        echo "null";
    }
}
// $conn->close();
?>