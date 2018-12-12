<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "warehouse".
 *
 * @property int $ware_id
 * @property string $warehouse_name
 * @property string $Description
 * @property string $location
 */
class Warehouse extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'warehouse';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['warehouse_name', 'Description', 'location'], 'required'],
            [['warehouse_name'], 'string', 'max' => 50],
            [['Description', 'location'], 'string', 'max' => 200],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'ware_id' => Yii::t('app', 'Ware ID'),
            'warehouse_name' => Yii::t('app', 'Warehouse Name'),
            'Description' => Yii::t('app', 'Description'),
            'location' => Yii::t('app', 'Location'),
        ];
    }
}
