<?php

namespace app\modules\api;

/**
 * api module definition class
 */
class Api extends \yii\base\Module
{
    /**
     * {@inheritdoc}
     */
    public $controllerNamespace = 'app\modules\api\controllers';

    /**
     * {@inheritdoc}
     */
    public function init()
    {
        parent::init();

        // custom initialization code goes here
        // \Yii::$app->setComponents(
        //     [
        //         'errorHandler'=>[
        //             'errorAction'=>'forum/forum/error',
        //             'class'=>'yii\web\ErrorHandler',
        //         ],     
        //         'jwt' => [
        //             'class' => \sizeg\jwt\Jwt::class,
        //             'key'   => 'secret',
        //           ],
        //     ]
        // );
    }
}
