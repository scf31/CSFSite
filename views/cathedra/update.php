<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Cathedra */

$this->title = 'Update Cathedra: ' . ' ' . $model->title;
$this->params['breadcrumbs'][] = ['label' => 'Cathedras', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->title, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="cathedra-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
