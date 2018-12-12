<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\warehouse */

$this->title = Yii::t('app', 'Update Warehouse: {name}', [
    'name' => $model->ware_id,
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Warehouses'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->ware_id, 'url' => ['view', 'id' => $model->ware_id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="warehouse-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
