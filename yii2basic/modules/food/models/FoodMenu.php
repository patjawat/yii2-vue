<?php

namespace app\modules\food\models;

use Yii;

/**
 * This is the model class for table "food_menu".
 *
 * @property int $id รหัส
 * @property string $name ชื่อ
 * @property string $photo รูปภาพ
 * @property float $price ราคา
 */
class FoodMenu extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'food_menu';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'photo', 'price'], 'required'],
            [['photo'], 'string'],
            [['price'], 'number'],
            [['name'], 'string', 'max' => 200],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'รหัส',
            'name' => 'ชื่อ',
            'photo' => 'รูปภาพ',
            'price' => 'ราคา',
        ];
    }
}
