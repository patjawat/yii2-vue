<?php

$params = require __DIR__ . '/params.php';
$db = require __DIR__ . '/db.php';

$config = [
    'id' => 'basic',
    'basePath' => dirname(__DIR__),
    'bootstrap' => ['log'],
    'aliases' => [
        '@bower' => '@vendor/bower-asset',
        '@npm'   => '@vendor/npm-asset',
    ],
    'modules' => [
        // 'rbac' => 'dektrium\rbac\RbacWebModule',
        'rbac' => [
            'class' => 'justcoded\yii2\rbac\Module'
        ],
        'user' => [
            'class' => 'dektrium\user\Module',
        ],
    ],
    'components' => [
        // 'authManager' => [
        //     'class' => 'yii\rbac\DbManager',
        //     'defaultRoles' => ['guest', 'user'],
        // ],
        'authManager' => [
            'class' => 'justcoded\yii2\rbac\components\DbManager',
            //'class' => 'justcoded\yii2\rbac\components\PhpManager',
        ],
        'request' => [
            // !!! insert a secret key in the following (if it is empty) - this is required by cookie validation
            'cookieValidationKey' => 'AEmzEOZZ7M7tuDLnD5gMg1qIPWYJ12j2',
        ],
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
        'user' => [
            'identityClass' => 'app\models\User',
            'enableAutoLogin' => true,
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
        'mailer' => [
            'class' => 'yii\swiftmailer\Mailer',
            // send all mails to a file by default. You have to set
            // 'useFileTransport' to false and configure a transport
            // for the mailer to send real emails.
            'useFileTransport' => true,
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'db' => $db,

        /*
        'urlManager' => [
            'enablePrettyUrl' => true,
            'showScriptName' => false,
            'rules' => [
            ],
        ],
        */
    ],
    'container' => [
        'definitions' => [
            // you can create your own GrivView to customize all options for main roles and permissions lists.
            'justcoded\yii2\rbac\widgets\RbacGridView' => [
                'class' => \app\modules\admin\widgets\RbacGridView::class,
            ],
            // this will replace bootstrap3 ActiveForm with bootstrap4 ActiveForm.
            'justcoded\yii2\rbac\widgets\RbacActiveForm' => [
                'class' => \yii\bootstrap4\ActiveForm::class,
            ],
        ],
    ],
    'as routeAccess' => [
		'class' => 'justcoded\yii2\rbac\filters\RouteAccessControl',
		'allowActions' => [
            // '*'
            'site/*',
            'rbac/*'
		],
		'allowRegexp' => '/(gii)/i', // optional
	],
    'params' => $params,
];

if (YII_ENV_DEV) {
    // configuration adjustments for 'dev' environment
    $config['bootstrap'][] = 'debug';
    $config['modules']['debug'] = [
        'class' => 'yii\debug\Module',
        // uncomment the following to add your IP if you are not connecting from localhost.
        //'allowedIPs' => ['127.0.0.1', '::1'],
    ];

    $config['bootstrap'][] = 'gii';
    $config['modules']['gii'] = [
        'class' => 'yii\gii\Module',
        // uncomment the following to add your IP if you are not connecting from localhost.
        //'allowedIPs' => ['127.0.0.1', '::1'],
    ];
}

return $config;
