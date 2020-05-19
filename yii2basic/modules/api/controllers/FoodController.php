<?php

namespace app\modules\api\controllers;

use app\modules\food\models\FoodMenu;
use sizeg\jwt\Jwt;
use sizeg\jwt\JwtHttpBearerAuth;
use Yii;
use yii\filters\ContentNegotiator;
use yii\filters\Cors;
use yii\filters\VerbFilter;
use yii\rest\Controller;
use yii\web\Response;

class FoodController extends Controller
{

    public static function allowedDomains()
    {
        return [
            '*',
        ];
    }

    private $_verbs = ['GET', 'POST', 'PATCH', 'PUT', 'DELETE'];
    public function behaviors()
    {
        $behaviors = parent::behaviors();
        $behaviors['contentNegotiator'] = [
            'class' => ContentNegotiator::className(),
            'formats' => [
                'application/json' => Response::FORMAT_JSON,
            ],
        ];
        $behaviors['corsFilter'] = [
            'class' => Cors::class,
        ];

        $behaviors['authenticator'] = [
            'class' => JwtHttpBearerAuth::class,
            'optional' => [
                'index'
            ],

        ];

        $behaviors['verbs'] = [
            'class' => VerbFilter::className(),
            'actions' => [
                'login' => ['POST'],
            ],
        ];

        return $behaviors;
    }
    public $modelClass = 'app\models\User';
    public $serializer = [
        'class' => 'yii\rest\Serializer',
        'collectionEnvelope' => 'items',
    ];
    public function actionIndex()
    {
        return FoodMenu::find()->all();
    }
    

}