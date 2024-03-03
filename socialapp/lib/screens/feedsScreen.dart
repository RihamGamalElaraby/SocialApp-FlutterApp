import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          const Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 20.0,
            margin: EdgeInsets.all(5),
            child: Stack(alignment: AlignmentDirectional.bottomEnd, children: [
              Image(
                image: NetworkImage(
                    'https://img.freepik.com/free-photo/close-up-young-happy-family-spending-time-together_329181-15884.jpg?w=826&t=st=1708565798~exp=1708566398~hmac=95591f4a7c00087def860ec1f33e418ff097c997492f23ba671326cb13501287'),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
              Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  'communicate with friends',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              )
            ]),
          ),
          ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
            itemBuilder: (context, index) => buildPostitem(context),
            itemCount: 10,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  Widget buildPostitem(context) => Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 20.0,
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 25.0,
                    backgroundImage: NetworkImage(
                        'https://img.freepik.com/free-photo/woman-beach-with-her-baby-enjoying-sunset_52683-144131.jpg?w=826&t=st=1709139774~exp=1709140374~hmac=8d5b19c1146e6ef66276e03ff36a3f0012ab93b8c465e41cc3473cbc0cdc723e'),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Riham Elaraby',
                            style: TextStyle(fontSize: 19, height: 1.4),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.check_circle,
                            color: Colors.blue,
                            size: 16.0,
                          ),
                        ],
                      ),
                      Text(
                        'January 13 , 2021 at 11:00 pm ',
                        style: TextStyle(fontSize: 14, height: 1.4),
                      )
                    ],
                  )),
                  const SizedBox(
                    width: 15,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey,
                ),
              ),
              const Text(
                'In grammar, an article is any member of a class of dedicated words that are used with noun phrases to mark the identifiability of the referents of the noun phrases. The category of articles constitutes a part of speech.In English, both "the" and "a(n)" are articles, which combine with nouns to form noun phrases. Articles typically specify the grammatical definiteness of the noun phrase, but in many languages, they carry additional grammatical information such as gender, number, and case. Articles are part of a broader category called determiners, which also include demonstratives, possessive determiners, and quantifiers. In linguistic interlinear glossing, articles are abbreviated as art.',
                style: TextStyle(),
              ),
              Container(
                width: double.infinity,
                child: Wrap(
                  children: [
                    Container(
                      height: 25,
                      child: OutlinedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Text(
                              '#software',
                              style: TextStyle(color: Colors.blue),
                            ),
                          )),
                    ),
                    Container(
                      height: 25,
                      child: OutlinedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Text(
                              '#software',
                              style: TextStyle(color: Colors.blue),
                            ),
                          )),
                    ),
                    Container(
                      height: 25,
                      child: OutlinedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Text(
                              '#software',
                              style: TextStyle(color: Colors.blue),
                            ),
                          )),
                    ),
                    Container(
                      height: 25,
                      child: OutlinedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Text(
                              '#software',
                              style: TextStyle(color: Colors.blue),
                            ),
                          )),
                    ),
                    Container(
                      height: 25,
                      child: OutlinedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Text(
                              '#software',
                              style: TextStyle(color: Colors.blue),
                            ),
                          )),
                    ),
                    Container(
                      height: 25,
                      child: OutlinedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Text(
                              '#software',
                              style: TextStyle(color: Colors.blue),
                            ),
                          )),
                    ),
                    Container(
                      height: 25,
                      child: OutlinedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Text(
                              '#software',
                              style: TextStyle(color: Colors.blue),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://img.freepik.com/free-photo/close-up-young-happy-family-spending-time-together_329181-15884.jpg?w=826&t=st=1708565798~exp=1708566398~hmac=95591f4a7c00087def860ec1f33e418ff097c997492f23ba671326cb13501287'),
                      fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.add_reaction_outlined),
                              SizedBox(
                                width: 7,
                              ),
                              Text(
                                '120',
                                style: TextStyle(fontSize: 14),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.chat),
                              SizedBox(
                                width: 7,
                              ),
                              Text(
                                '215 Comment',
                                style: TextStyle(fontSize: 14),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey,
              ),
              SizedBox(
                height: 5,
              ),
              Row(children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 15.0,
                            backgroundImage: NetworkImage(
                                'https://img.freepik.com/free-photo/woman-beach-with-her-baby-enjoying-sunset_52683-144131.jpg?w=826&t=st=1709139774~exp=1709140374~hmac=8d5b19c1146e6ef66276e03ff36a3f0012ab93b8c465e41cc3473cbc0cdc723e'),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'Write a comment',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ]),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.add_reaction_outlined),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        'Like',
                        style: TextStyle(fontSize: 14),
                      )
                    ],
                  ),
                ),
              ]),
            ],
          ),
        ),
      );
}
