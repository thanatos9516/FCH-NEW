<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "product".
 *
 * @property int $productid
 * @property int $categoryid
 * @property string $product_name
 * @property double $product_price
 * @property double $product_qty
 * @property string $photo
 * @property int $supplierid
 * @property string $description
 * @property string $video
 * @property string $tech
 *
 * @property Carousel[] $carousels
 */
class Product extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'product';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['categoryid', 'product_name', 'product_price', 'product_qty', 'photo', 'supplierid', 'description', 'video', 'tech'], 'required'],
            [['categoryid', 'supplierid'], 'integer'],
            [['product_price', 'product_qty'], 'number'],
            [['product_name'], 'string', 'max' => 150],
            [['photo'], 'string', 'max' => 200],
            [['description', 'video'], 'string', 'max' => 1000],
            [['tech'], 'string', 'max' => 3000],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'productid' => Yii::t('app', 'Productid'),
            'categoryid' => Yii::t('app', 'Categoryid'),
            'product_name' => Yii::t('app', 'Product Name'),
            'product_price' => Yii::t('app', 'Product Price'),
            'product_qty' => Yii::t('app', 'Product Qty'),
            'photo' => Yii::t('app', 'Photo'),
            'supplierid' => Yii::t('app', 'Supplierid'),
            'description' => Yii::t('app', 'Description'),
            'video' => Yii::t('app', 'Video'),
            'tech' => Yii::t('app', 'Tech'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCarousels()
    {
        return $this->hasMany(Carousel::className(), ['productid' => 'productid']);
    }
}
