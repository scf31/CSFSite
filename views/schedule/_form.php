<?php

use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Schedule */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="schedule-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'id')->textInput() ?>

    <?= $form->field($model, 'parity')->dropDownList([ 'Числитель' => 'Числитель', 'Знаменатель' => 'Знаменатель', 'Всегда' => 'Всегда', ], ['prompt' => '']) ?>

    <?= $form->field($model, 'lesson_id')->dropDownList(ArrayHelper::map(\app\models\Lesson::find()->all(),'id','number')) ?>

    <?= $form->field($model, 'weekday_title')->dropDownList(ArrayHelper::map(\app\models\Weekday::find()->all(),'title','title')); ?>

    <?= $form->field($model, 'classrom_title')->dropDownList(ArrayHelper::map(\app\models\Classroom::find()->all(),'title','title')) ?>

    <?= $form->field($model, 'subject_id')->dropDownList(ArrayHelper::map(\app\models\Subject::find()->all(),'id','title')) ?>

    <?= $form->field($model, 'group_id')->dropDownList(ArrayHelper::map(\app\models\Group::find()->all(),'id','title')) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
