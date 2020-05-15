<?php
namespace app\commands;

use yii\console\Controller;
use yii\console\ExitCode;
use Yii;
use app\models\User;

class AppController extends Controller{
    
    public function actionAddUser($username, $password){
        $security = Yii::$app->security;
        $user = new User();
        // $user->username = $username;
        // $user->password_hash = $security->generatePasswordHash($password);
        // $user->access_token = $security->generrateRandomString(255);
        // if($user->save){
        //     Console::output('Save');
        // }else{
        //     var_dump($user->errors);
        //     Console::output('Not save');
        // }    
        // return $username;
        echo $message . "\n";

        return ExitCode::OK;
    }
}