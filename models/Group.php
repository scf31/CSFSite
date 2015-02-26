<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "Group".
 *
 * @property integer $id
 * @property integer $course
 * @property double $number
 * @property integer $capacity
 * @property string $profession
 *
 * @property Schedule[] $schedules
 * @property Student[] $students
 */
class Group extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'Group';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['course', 'number'], 'required'],
            [['course', 'capacity'], 'integer'],
            [['number'], 'number'],
            [['profession'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'course' => 'Course',
            'number' => 'Number',
            'capacity' => 'Capacity',
            'profession' => 'Profession',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSchedules()
    {
        return $this->hasMany(Schedule::className(), ['group_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStudents()
    {
        return $this->hasMany(Student::className(), ['group_id' => 'id']);
    }
}
