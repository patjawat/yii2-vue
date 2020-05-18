<?php

namespace app\modules\api\controllers;

use app\models\User;
use sizeg\jwt\Jwt;
use sizeg\jwt\JwtHttpBearerAuth;
use Yii;
use yii\filters\ContentNegotiator;
use yii\filters\Cors;
use yii\filters\VerbFilter;
use yii\rest\Controller;
use yii\web\Response;

class UserController extends Controller
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
        // add CORS filter
        $behaviors['corsFilter'] = [
            'class' => Cors::class,
            // 'cors' => [
            //     'Origin' => ['*'],
            //     'Access-Control-Request-Method' => $this->_verbs,
            //     'Access-Control-Allow-Headers' => ['content-type'],
            //     'Access-Control-Request-Headers' => ['*'],
            // ],
        ];

        $behaviors['authenticator'] = [
            'class' => JwtHttpBearerAuth::class,
            'optional' => [
                'login',
                'me',
                // 'index'
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
        return [
            'status' => User::find()->select(['id', 'username'])->all(),
        ];
    }
    public function actionLogin()
    {
        if (Yii::$app->request->isPost) {
            $post = Yii::$app->request->bodyParams;

            $username = $post['username'];
            $password = $post['password'];
            $check = $this->AuthCheck($username, $password);
            return $check;

        }

    }

    public function actionData()
    {
        return $this->asJson([
            'success' => true,
        ]);
    }

    private function AuthCheck($username, $password)
    {

        $user = User::findByUsername($username);

        if ($user) {
            if ($user->validatePassword($password)) {
                return $this->actionAuth($user->auth_key);
            } else {
                return [
                    'status' => false,
                    'message' => 'รหัสผ่านม่ถูกต้อง',
                    'data' => null,
                ];
            }

        } else {
            return [
                'status' => false,
                'message' => 'ชื่อผู้ใช้ไม่ถูกต้อง',
                'data' => null,
            ];
        }
    }

    public function actionAuth($auth_key)
    {
        /** @var Jwt $jwt */
        $jwt = Yii::$app->jwt;
        $signer = $jwt->getSigner('HS256');
        $key = $jwt->getKey();
        $time = time();
        // Adoption for lcobucci/jwt ^4.0 version
        $token = $jwt->getBuilder()
            ->issuedBy('http://example.com')
            ->permittedFor('http://example.org')
            ->identifiedBy('4f1g23a12aa', true)
            ->issuedAt($time)
            ->expiresAt($time + 3600)
            ->withClaim('uid', $auth_key) // auth_key ใน ตาราง user
            ->getToken($signer, $key);
        return $this->asJson([
            'status' => true,
            'token' => (string) $token,
        ]);
    }

    public function actionMe()
    {
        $model = User::findOne(Yii::$app->user->id);
        return [
            ' status' => 'success',
            'data' => [
                'username' => $model->username,
                'email' => $model->email,
            ],
        ];

    }

}