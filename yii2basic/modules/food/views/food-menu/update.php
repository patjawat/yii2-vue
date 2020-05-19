<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\modules\food\models\FoodMenu */

$this->title = 'Update Food Menu: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Food Menus', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="food-menu-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
