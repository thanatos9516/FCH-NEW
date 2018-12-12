<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\category */

$this->title = Yii::t('app', 'Update Category: {name}', [
    'name' => $model->categoryid,
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Categories'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->categoryid, 'url' => ['view', 'id' => $model->categoryid]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="category-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
