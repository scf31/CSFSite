<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "Teacher".
 *
 * @property integer $id
 * @property string $fio
 * @property string $rank
 * @property integer $cathedra_id
 * @property integer $user_id
 *
 * @property Subject[] $subjects
 * @property Cathedra $cathedra
 * @property User $user
 */
class Teacher extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'Teacher';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['fio'], 'required'],
            [['cathedra_id', 'user_id'], 'integer'],
            [['fio', 'rank'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'fio' => 'Fio',
            'rank' => 'Rank',
            'cathedra_id' => 'Cathedra ID',
            'user_id' => 'User ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSubjects()
    {
        return $this->hasMany(Subject::className(), ['teacher_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCathedra()
    {
        return $this->hasOne(Cathedra::className(), ['id' => 'cathedra_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }
}
