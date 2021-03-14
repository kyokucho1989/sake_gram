export const state = () => ({
  questions: [
    {
      title: '1',
      discription: '初対面の人に会うのが好きで、誰とでも会話を楽しむことができる',
      answer: '未回答'
    },
    {
      title: '2',
      discription: '他人に思いやりがあり、誰にでも分け隔てなく親切にできている',
      answer: '未回答'
    },
    {
      title: '3',
      discription: '物事をきっちりこなし、手際よく効率よく行なっている',
      answer: '未回答'
    },
    {
      title: '4',
      discription: 'いつも心配事が多く、不安になりやすい',
      answer: '未回答'
    },
    {
      title: '5',
      discription: '新しいことを知ることが好きで、好奇心や探究心が強い',
      answer: '未回答'
    },
    {
      title: '6',
      discription: '恥ずかしがり屋で物静かである',
      answer: '未回答'
    },
    {
      title: '7',
      discription: '思ったことはすぐに意見し、他人の感情に流されず冷静な判断をする',
      answer: '未回答'
    },
    {
      title: '8',
      discription: '後先考えずに行動して、ぎりぎりまで物事に手をつけないところがある',
      answer: '未回答'
    },
    {
      title: '9',
      discription: '大抵リラックスして落ち着いている',
      answer: '未回答'
    },
    {
      title: '10',
      discription: '物事を現実的に考え、常識破りなことはしない、保守的な考え方である',
      answer: '未回答'
    }
  ]
})

export const getters = {
  questions: state => state.questions
}

export const mutations = {
  updateAnswer (state, { indexNum, pt }) {
    const index = state.questions.findIndex(question => question.title === indexNum)
    state.questions[index].answer = pt
  }
}
