<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "Schedule".
 *
 * @property integer $id
 * @property string $parity
 * @property integer $lesson_id
 * @property string $weekday_title
 * @property string $classrom_title
 * @property integer $subject_id
 * @property integer $group_id
 *
 * @property Classroom $classromTitle
 * @property Group $group
 * @property Lesson $lesson
 * @property Subject $subject
 * @property Weekday $weekdayTitle
 */
class Schedule extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'Schedule';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['parity', 'lesson_id', 'weekday_title', 'classrom_title', 'subject_id', 'group_id'], 'required'],
            [['parity'], 'string'],
            [['lesson_id', 'subject_id', 'group_id'], 'integer'],
            [['weekday_title', 'classrom_title'], 'string', 'max' => 50]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'parity' => 'Parity',
            'lesson_id' => 'Lesson ID',
            'weekday_title' => 'Weekday Title',
            'classrom_title' => 'Classrom Title',
            'subject_id' => 'Subject ID',
            'group_id' => 'Group ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getClassromTitle()
    {
        return $this->hasOne(Classroom::className(), ['title' => 'classrom_title']);
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
    public function getLesson()
    {
        return $this->hasOne(Lesson::className(), ['id' => 'lesson_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSubject()
    {
        return $this->hasOne(Subject::className(), ['id' => 'subject_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getWeekdayTitle()
    {
        return $this->hasOne(Weekday::className(), ['title' => 'weekday_title']);
    }
}
