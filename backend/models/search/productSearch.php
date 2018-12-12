<?php

namespace app\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\product;

/**
 * productSearch represents the model behind the search form of `app\models\product`.
 */
class productSearch extends product
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['productid', 'categoryid', 'supplierid', 'barcode'], 'integer'],
            [['product_name', 'photo', 'description', 'video', 'tech'], 'safe'],
            [['product_price', 'product_qty'], 'number'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = product::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'productid' => $this->productid,
            'categoryid' => $this->categoryid,
            'product_price' => $this->product_price,
            'product_qty' => $this->product_qty,
            'supplierid' => $this->supplierid,
            'barcode' => $this->barcode,
        ]);

        $query->andFilterWhere(['like', 'product_name', $this->product_name])
            ->andFilterWhere(['like', 'photo', $this->photo])
            ->andFilterWhere(['like', 'description', $this->description])
            ->andFilterWhere(['like', 'video', $this->video])
            ->andFilterWhere(['like', 'tech', $this->tech]);

        return $dataProvider;
    }
}
