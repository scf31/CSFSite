<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "Student".
 *
 * @property integer $id
 * @property string $fio
 * @property string $type
 * @property integer $group_id
 * @property integer $cathedra_id
 * @property integer $user_id
 *
 * @property Cathedra $cathedra
 * @property Group $group
 * @property User $user
 */
class Student extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'Student';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['fio', 'group_id', 'cathedra_id'], 'required'],
            [['group_id', 'cathedra_id', 'user_id'], 'integer'],
            [['fio', 'type'], 'string', 'max' => 255]
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
            'type' => 'Бакалавр/магистр/специалист',
            'group_id' => 'Group ID',
            'cathedra_id' => 'Cathedra ID',
            'user_id' => 'User ID',
        ];
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
    public function getGroup()
    {
        return $this->hasOne(Group::className(), ['id' => 'group_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }
}
