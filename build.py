import argparse
import os
import shutil

build_path = './build/app/outputs/apk/release'
target_parent_path = os.getcwd() + '/apk/'


def path_create(environment):
    _path = target_parent_path + environment + '/'
    if not os.path.exists(_path):
        os.makedirs(_path)


def apk_move(environment):
    for filepath, dirs, filenames in os.walk(build_path):
        for filename in filenames:
            if filename.endswith('.apk'):
                apk_path = os.path.join(filepath, filename)
                shutil.move(apk_path, target_parent_path + environment + '/')
                return True
    return False


def build(environment):
    path_create(environment)
    build_res = os.system('flutter build apk --dart-define=env=%s' % environment)
    if build_res != 0:
        raise Exception('build failed...')
    apk_move(environment)
    print('build success')


def sit():
    build('sit')


def uat():
    build('uat')


def prod():
    build('prod')


# fire.Fire()


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("-e", "--env", default='sit', required=False)
    parser.add_argument("-r", "--remark", default='none', nargs='+', required=False)
    args = parser.parse_args()
    env = args.env
    remark = " , ".join(str(i) for i in args.remark)
    build(env)
    print(args)
