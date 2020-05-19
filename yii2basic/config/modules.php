<?php

use \kartik\datecontrol\Module;

//เพิ่ม module ที่นี่ที่เดียว
$modules = [];

$modules['datecontrol'] = [
    'class' => 'kartik\datecontrol\Module',
    'displaySettings' => [
        Module::FORMAT_DATE => 'dd/MM/yyyy',
        Module::FORMAT_TIME => 'hh:mm:ss a',
        Module::FORMAT_DATETIME => 'dd/MM/yyyy hh:mm:ss a',
    ],
    'saveSettings' => [
        Module::FORMAT_DATE => 'php:Y-m-d',
        Module::FORMAT_TIME => 'php:H:i:s',
        Module::FORMAT_DATETIME => 'php:Y-m-d H:i:s',
    ],
    'displayTimezone' => 'Asia/Bankok',
    'saveTimezone' => 'UTC',
    'autoWidget' => true,
    'autoWidgetSettings' => [
        Module::FORMAT_DATE => ['type' => 2, 'pluginOptions' => ['autoclose' => true]], // example
        Module::FORMAT_DATETIME => [],
        Module::FORMAT_TIME => [],
    ],]; //Oh

$modules['user'] = [
    'class' => 'dektrium\user\Module',
    'enableUnconfirmedLogin' => true,
    'confirmWithin' => 21600,
    'cost' => 12,
    'admins' => ['admin'],
    'controllerMap' => [
        'login' => [
            'class' => \dektrium\user\controllers\SecurityController::className(),
            'on ' . \dektrium\user\controllers\SecurityController::EVENT_AFTER_LOGIN => function ($e) {
                // Yii::$app->response->redirect(array('/user/security/login'))->send();
                Yii::$app->response->redirect(array('/site/login'))->send();
                Yii::$app->end();
            },
        ],
    ],
];


// $modules['usermanager'] = ['class' => 'app\modules\usermanager\Usermanager']; //จัดการผู้ใช้งานระบบ
$modules['api'] = ['class' => 'app\modules\api\Api']; //จัดการผู้ใช้งานระบบ

return $modules;