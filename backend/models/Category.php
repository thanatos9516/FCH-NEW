<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "category".
 *
 * @property int $categoryid
 * @property string $category_name
 */
class Category extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'category';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['category_name', 'description'], 'required'],
            [['category_name', 'description'], 'string', 'max' => 30],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'categoryid' => Yii::t('app', 'Categoryid'),
            'category_name' => Yii::t('app', 'Category Name'),
            'description' => Yii::t('app', 'Description'),
        ];
    }
}
