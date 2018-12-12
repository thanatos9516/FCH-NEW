<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\search\productSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="product-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'options' => [
            'data-pjax' => 1
        ],
    ]); ?>

    <?= $form->field($model, 'productid') ?>

    <?= $form->field($model, 'categoryid') ?>

    <?= $form->field($model, 'product_name') ?>

    <?= $form->field($model, 'product_price') ?>

    <?= $form->field($model, 'product_qty') ?> 
    
    <?= $form->field($model, 'barcode') ?> 

    <?php // echo $form->field($model, 'photo') ?>

    <?php // echo $form->field($model, 'supplierid') ?>

    <?php // echo $form->field($model, 'description') ?>

    <?php // echo $form->field($model, 'video') ?>

    <?php // echo $form->field($model, 'tech') ?> 

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
